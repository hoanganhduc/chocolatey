$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'softether-vpn-client'
  softwareName  = 'softether-vpn-client'
  fileType      = 'exe'
  silentArgs    = ""
  url           = 'https://www.softether-download.com/files/softether/v4.43-9799-beta-2023.08.31-tree/Windows/SoftEther_VPN_Client/softether-vpnclient-v4.43-9799-beta-2023.08.31-windows-x86_x64-intel.exe'
  checksum      = '1c5e5cfc9734ff29821969738d78fcf53e2817ce070368217b329affe389295b' # v4.43-9799-rtm-2023.08.31
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