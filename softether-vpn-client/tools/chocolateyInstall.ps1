$ErrorActionPreference = 'Stop'

$packageName = 'softether-vpn-client'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$tempRoot = Join-Path $env:TEMP 'chocolatey-softether-vpn-client'
$extractDir = Join-Path $tempRoot 'extract'

$zipName = 'vpngate-client-2026.04.18-build-9807.164492.zip'
$zipUrl = "https://download.vpngate.jp/common/cd.aspx/$zipName"
$zipFile = Join-Path $tempRoot $zipName
$ahkLogFile = Join-Path $tempRoot 'softether-vpn-client-install.ahk.log'

$installerName = 'vpngate-client-v4.44-9807-rtm-2025.04.16.exe'
$installerChecksum = 'ab006331f1f646bc319585088239d55bc54ecde5c269009268e9598307da7a44'
$installerPath = Join-Path $extractDir $installerName

if (Test-Path $tempRoot -PathType Container) {
  Remove-Item $tempRoot -Recurse -Force -ErrorAction SilentlyContinue
}

New-Item -ItemType Directory -Path $extractDir -Force | Out-Null

# VPN Gate's cd.aspx endpoint mutates the wrapper ZIP while keeping the embedded
# installer stable. Download the ZIP directly and validate the extracted payload.
Get-WebFile -Url $zipUrl -FileName $zipFile
Get-ChocolateyUnzip -PackageName $packageName -FileFullPath $zipFile -Destination $extractDir

$requiredFiles = @(
  $installerName,
  'VpnGatePlugin_x86.dll',
  'VpnGatePlugin_x64.dll',
  'xmlrpc.config',
  'VPNGate.db',
  'VPNGate.dat'
)

$missingFiles = $requiredFiles |
  Where-Object { -not (Test-Path (Join-Path $extractDir $_) -PathType Leaf) }

if ($missingFiles.Count -gt 0) {
  throw "Expected files not found after extraction: $($missingFiles -join ', '). Upstream archive layout may have changed."
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

$ahkExe = Join-Path $env:ChocolateyInstall 'lib\autohotkey.portable\tools\AutoHotkey.exe'
$ahkExe = if (Test-Path $ahkExe -PathType Leaf) { $ahkExe } else { (Get-Command AutoHotKey).Path }
$ahkFile = Join-Path $toolsDir 'softether-vpn-clientInstall.ahk'
$ahkProc = Start-Process -FilePath $ahkExe -ArgumentList @($ahkFile, $ahkLogFile) -PassThru

Write-Debug "$ahkExe start time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$($ahkProc.Id)"
Write-Debug "AutoHotkey log:`t$ahkLogFile"

Install-ChocolateyInstallPackage @packageArgs

$ahkProc.Refresh()
if (-not $ahkProc.HasExited) {
  $null = $ahkProc.WaitForExit(15000)
  $ahkProc.Refresh()
}

if (-not $ahkProc.HasExited) {
  throw "AutoHotkey helper is still running after the installer exited. See $ahkLogFile for progress."
}

if ($ahkProc.ExitCode -ne 0) {
  $logHint = if (Test-Path $ahkLogFile -PathType Leaf) { " See $ahkLogFile for details." } else { '' }
  throw "AutoHotkey helper exited with code $($ahkProc.ExitCode).$logHint"
}
