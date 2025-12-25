$ErrorActionPreference = 'Stop'

$packageName = 'softether-vpn-client'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$downloadPageUrl = 'https://www.vpngate.net/en/download.aspx'
$zipBaseUrl = 'https://download.vpngate.jp/common/cd.aspx'

# VPN Gate currently publishes a ZIP per build. Keep a pinned fallback when online lookup is unavailable.
$fallbackDate = '2023.08.31'
$fallbackBuild = '161457'
$fallbackZipName = "vpngate-client-$fallbackDate-build-9799.$fallbackBuild.zip"

function Get-LatestSoftEtherPackageInfo {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)][string] $PageUrl
  )

  $pattern = 'vpngate-client-(?<date>\d{4}\.\d{2}\.\d{2})-build-(?<build>9799\.\d+)\.zip'

  try {
    $response = Invoke-WebRequest -Uri $PageUrl -UseBasicParsing -ErrorAction Stop
    $match = [regex]::Match($response.Content, $pattern)
    if ($match.Success) {
      return [pscustomobject]@{
        Date     = $match.Groups['date'].Value
        Build    = $match.Groups['build'].Value
        FileName = $match.Value
      }
    }

    Write-Warning 'Unable to locate a VPN Gate ZIP link on the download page. Falling back to pinned version.'
  } catch {
    Write-Warning "Failed to query VPN Gate download page for the latest version: $_"
  }

  return $null
}

$zipInfo = Get-LatestSoftEtherPackageInfo -PageUrl $downloadPageUrl
if (-not $zipInfo) {
  $zipInfo = [pscustomobject]@{
    Date     = $fallbackDate
    Build    = $fallbackBuild
    FileName = $fallbackZipName
  }
}

$baseName = "vpngate-client-v4.43-9799-beta-$($zipInfo.Date)"
$zipName = $zipInfo.FileName
$zipUrl = "$zipBaseUrl/$zipName"
$zipFile = Join-Path $toolsDir $zipName

Write-Host "Downloading VPN Gate SoftEther client build $($zipInfo.Build) from $zipUrl"

try {
  # Ensure TLS 1.2 support in older environments
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12
} catch {
  Write-Warning 'Unable to set TLS 1.2 on this platform. Download may fail if the host requires it.'
}

if (-not (Test-Path $zipFile -PathType Leaf)) {
  Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $zipFile -Url $zipUrl
}

Get-ChildItem -Path $toolsDir -Directory -Filter 'vpngate-client-*' -ErrorAction SilentlyContinue |
  Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

Get-ChocolateyUnzip -PackageName $packageName -FileFullPath $zipFile -Destination $toolsDir
Remove-Item $zipFile -Force -ErrorAction SilentlyContinue

$extractDir = Get-ChildItem -Path $toolsDir -Directory -Filter 'vpngate-client-*' -ErrorAction SilentlyContinue |
  Sort-Object LastWriteTime -Descending |
  Select-Object -First 1

if (-not $extractDir) {
  throw "Extraction did not create a vpngate-client directory under '$toolsDir'."
}

$executable = Join-Path $extractDir.FullName ("$($extractDir.Name).exe")
if (-not (Test-Path $executable -PathType Leaf)) {
  $foundInstaller = Get-ChildItem -Path $extractDir.FullName -Filter '*.exe' -Recurse -File -ErrorAction SilentlyContinue |
    Select-Object -First 1
  if ($foundInstaller) {
    $executable = $foundInstaller.FullName
  }
}

if (-not (Test-Path $executable -PathType Leaf)) {
  throw "Expected installer not found after extraction. Looked in '$extractDir'."
}

$checksum64 = (Get-FileHash -Path $executable -Algorithm SHA256).Hash

$packageArgs = @{
  packageName    = $packageName
  softwareName   = $packageName
  fileType       = 'exe'
  file64         = $executable
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = ''
  validExitCodes = @(0, 3010, 1641)
}

# Stop any existing AutoHotkey processes to avoid conflicting input automation
try {
  $existingAhkProcesses = Get-Process -Name 'AutoHotKey' -ErrorAction SilentlyContinue
  if ($existingAhkProcesses) {
    Write-Host 'Stopping existing AutoHotkey processes...'
    Stop-Process -Name 'AutoHotKey' -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
  }
} catch {
  Write-Warning "Could not terminate existing AutoHotkey processes: $_"
}

$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir 'softether-vpn-clientInstall.ahk'
$ahkProc = Start-Process -FilePath $ahkExe -ArgumentList "`"$ahkFile`"" -PassThru

Write-Debug "$ahkExe start time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$($ahkProc.Id)"

Install-ChocolateyPackage @packageArgs
