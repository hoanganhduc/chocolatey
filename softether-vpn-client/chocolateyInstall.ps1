$ErrorActionPreference = 'Stop'

$packageName = 'softether-vpn-client'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# VPN Gate SoftEther VPN Client build 4.43.9799.161457 (2023-08-31)
$date = '2023.08.31'
$build = '161457'
$baseName = "vpngate-client-v4.43-9799-beta-$date"
$zipName = "vpngate-client-$date-build-9799.$build.zip"
$zipUrl = "https://download.vpngate.jp/common/cd.aspx/$zipName"
$zipFile = Join-Path $toolsDir $zipName
$extractDir = Join-Path $toolsDir $baseName
$executable = Join-Path $extractDir "$baseName.exe"

try {
  # Ensure TLS 1.2 support in older environments
  [System.Net.ServicePointManager]::SecurityProtocol = \
    [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12
} catch {
  Write-Warning 'Unable to set TLS 1.2 on this platform. Download may fail if the host requires it.'
}

if (-not (Test-Path $zipFile -PathType Leaf)) {
  Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $zipFile -Url $zipUrl
}

if (Test-Path $extractDir -PathType Container) {
  Remove-Item $extractDir -Recurse -Force -ErrorAction SilentlyContinue
}

Get-ChocolateyUnzip -PackageName $packageName -FileFullPath $zipFile -Destination $toolsDir
Remove-Item $zipFile -Force -ErrorAction SilentlyContinue

$packageArgs = @{
  packageName    = 'softether-vpn-client'
  softwareName   = 'softether-vpn-client'
  fileType       = 'exe'
  file64         = $executable
  checksum64     = '1c5e5cfc9734ff29821969738d78fcf53e2817ce070368217b329affe389295b' # v4.43-9799-beta-2023.08.31
  checksumType64 = 'sha256'
  silentArgs     = ''
  validExitCodes = @(0, 3010, 1641)
}

if (-not (Test-Path $executable -PathType Leaf)) {
  Write-Error "Expected installer not found at '$executable'. Unzip may have failed or layout changed."
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
