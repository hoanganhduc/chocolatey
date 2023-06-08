$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'softether-vpn-client'
  softwareName  = 'softether-vpn-client'
  fileType      = 'exe'
  silentArgs    = ""
  url           = 'https://www.softether-download.com/files/softether/v4.41-9787-rtm-2023.03.14-tree/Windows/SoftEther_VPN_Client/softether-vpnclient-v4.41-9787-rtm-2023.03.14-windows-x86_x64-intel.exe'
  checksum      = '5ced0510a4335e2503434692e0b9a6b4f7c287141beb3069e16d5d4da2cbed85' # v4.41-9787-rtm-2023.03.14
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