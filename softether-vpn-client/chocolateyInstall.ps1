$ErrorActionPreference = 'Stop';

# $date = Get-Date -Format "yyyy.MM.dd"
$date="2025.04.06"
$build="161472"
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$zipFileUrl = "https://download.vpngate.jp/common/cd.aspx/vpngate-client-$date-build-9799.$build.zip"
$fileLocation = Join-Path $toolsDir "vpngate-client-$date-build-9799.$build.zip"
$exefileLocation = Join-Path $toolsDir "vpngate-client-v4.43-9799-beta-2023.08.31.exe"

$packageArgs = @{
  packageName   = 'softether-vpn-client'
  softwareName  = 'softether-vpn-client'
  fileType      = 'exe'
  silentArgs    = ""
  file64          = $exefileLocation
  validExitCodes = @(0, 3010, 1641)
  checksum      = '1c5e5cfc9734ff29821969738d78fcf53e2817ce070368217b329affe389295b' # v4.43-9799-beta-2023.08.31
  checksumType  = 'sha256'
}

if(!(Test-Path $fileLocation -PathType leaf))
{
  # Get-ChocolateyWebFile -PackageName 'softether-vpn-client' -FileFullPath "$fileLocation" -Url "$zipFileUrl"
  Invoke-WebRequest -URI "$zipFileUrl" -OutFile "$fileLocation"
}
Get-ChocolateyUnzip -FileFullPath "$fileLocation" -Destination "$toolsDir"
Remove-Item $fileLocation -Force -Confirm:$false

# Stop any existing AutoHotkey processes
try {
  $existingAhkProcesses = Get-Process -Name "AutoHotKey" -ErrorAction SilentlyContinue
  if ($existingAhkProcesses) {
    Write-Host "Stopping existing AutoHotkey processes..."
    Stop-Process -Name "AutoHotKey" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1 # Give processes time to terminate
  }
} catch {
  Write-Warning "Could not terminate existing AutoHotkey processes: $_"
}

$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir "softether-vpn-clientInstall.ahk"
$ahkProc = Start-Process -FilePath $ahkExe `
                         -ArgumentList "`"$ahkFile`"" `
                         -PassThru

$ahkId = $ahkProc.Id
Write-Debug "$ahkExe start time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$ahkId"

Install-ChocolateyPackage @packageArgs