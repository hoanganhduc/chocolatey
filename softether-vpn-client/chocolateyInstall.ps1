$ErrorActionPreference = 'Stop';

$date = Get-Date -Format "yyyy.MM.dd"
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$zipFileUrl = "https://download.vpngate.jp/common/cd.aspx/vpngate-client-$date-build-9799.161457.zip"
$fileLocation = Join-Path $toolsDir "vpngate-client-$date-build-9799.161457.zip"
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

$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir "softether-vpn-clientInstall.ahk"
$ahkProc = Start-Process -FilePath $ahkExe `
                         -ArgumentList "`"$ahkFile`"" `
                         -PassThru

$ahkId = $ahkProc.Id
Write-Debug "$ahkExe start time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$ahkId"

Install-ChocolateyPackage @packageArgs