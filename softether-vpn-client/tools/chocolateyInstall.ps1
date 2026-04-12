$ErrorActionPreference = 'Stop'

$packageName = 'softether-vpn-client'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$tempRoot = Join-Path $env:TEMP 'chocolatey-softether-vpn-client'
$extractDir = Join-Path $tempRoot 'extract'

$zipName = 'vpngate-client-2026.04.10-build-9807.164421.zip'
$zipUrl = "https://download.vpngate.jp/common/cd.aspx/$zipName"
$zipFile = Join-Path $tempRoot $zipName
$zipChecksum = '85dba3786c8dd82d1c3db30b12282717d5a9f3367f9ab2dc281a44c2bb38430c'

$installerName = 'vpngate-client-v4.44-9807-rtm-2025.04.16.exe'
$installerChecksum = 'ab006331f1f646bc319585088239d55bc54ecde5c269009268e9598307da7a44'
$installerPath = Join-Path $extractDir $installerName

if (Test-Path $tempRoot -PathType Container) {
  Remove-Item $tempRoot -Recurse -Force -ErrorAction SilentlyContinue
}

New-Item -ItemType Directory -Path $extractDir -Force | Out-Null

$downloadArgs = @{
  PackageName  = $packageName
  FileFullPath = $zipFile
  Url          = $zipUrl
  Checksum     = $zipChecksum
  ChecksumType = 'sha256'
}

Get-ChocolateyWebFile @downloadArgs
Get-ChocolateyUnzip -PackageName $packageName -FileFullPath $zipFile -Destination $extractDir

if (-not (Test-Path $installerPath -PathType Leaf)) {
  throw "Expected installer not found at '$installerPath'. Upstream archive layout may have changed."
}

Get-ChecksumValid -File $installerPath -Checksum $installerChecksum -ChecksumType 'sha256' -OriginalUrl $zipUrl

$packageArgs = @{
  packageName    = $packageName
  softwareName   = 'SoftEther VPN Client*'
  fileType       = 'exe'
  file           = $installerPath
  silentArgs     = ''
  validExitCodes = @(0, 3010, 1641)
}

try {
  Get-Process -Name 'AutoHotKey', 'AutoHotkey', 'AutoHotkeyU32', 'AutoHotkeyU64' -ErrorAction SilentlyContinue |
    Stop-Process -Force -ErrorAction SilentlyContinue
} catch {
  Write-Warning "Could not terminate existing AutoHotkey processes: $_"
}

$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir 'softether-vpn-clientInstall.ahk'
$ahkProc = Start-Process -FilePath $ahkExe -ArgumentList "`"$ahkFile`"" -PassThru

Write-Debug "$ahkExe start time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$($ahkProc.Id)"

Install-ChocolateyInstallPackage @packageArgs
