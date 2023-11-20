$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$zipFileUrl = "https://download.vpngate.jp/common/cd.aspx/vpngate-client-2023.11.03-build-9799.157316.zip"
$fileLocation = Join-Path $toolsDir "vpngate-client-2023.11.03-build-9799.157316.zip"
$exefileLocation = Join-Path $toolsDir "vpngate-client-v4.43-9799-beta-2023.08.31.exe"

$packageArgs = @{
  packageName   = 'softether-vpn-client'
  softwareName  = 'softether-vpn-client'
  fileType      = 'exe'
  silentArgs    = ""
  file          = $exefileLocation
  validExitCodes = @(0, 3010, 1641)
  checksum      = '1c5e5cfc9734ff29821969738d78fcf53e2817ce070368217b329affe389295b' # v4.43-9799-rtm-2023.08.31
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