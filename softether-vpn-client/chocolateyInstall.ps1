$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'softether-vpn-client'
  softwareName  = 'softether-vpn-client'
  fileType      = 'exe'
  silentArgs    = ""
  url           = 'https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.39-9772-beta/softether-vpnclient-v4.39-9772-beta-2022.04.26-windows-x86_x64-intel.exe'
  checksum      = '226e6b37712bdf43e43b98768b6b1e711be7c5a07807cb3f0fc59532e36cc5e5' # v4.39-9772-beta-2022.04.26
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