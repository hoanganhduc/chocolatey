$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'softether-vpn-client'
  softwareName  = 'softether-vpn-client'
  fileType      = 'exe'
  silentArgs    = ""
  url           = 'https://jp.softether-download.com/files/softether/v4.38-9760-rtm-2021.08.17-tree/Windows/SoftEther_VPN_Client/softether-vpnclient-v4.38-9760-rtm-2021.08.17-windows-x86_x64-intel.exe'
  checksum      = 'fe1cf6cd8d78c063f898d1841feecd35db0d5d2ab0e3d51a709924ea1d2b4b7c' # 4.38-9760-rtm-2021.08.17
  checksumType  = 'sha256'
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