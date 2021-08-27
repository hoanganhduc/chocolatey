$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'flashboot'
  softwareName  = 'FlashBoot'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://flashboot-v3.prime-expert.com/flashboot-3.3j-setup.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '067c1b15854ccddb1ede3efd3e702d686cc44310f1f73d37377d734c99d9ba22' # 3.3j
  checksumType  = 'sha256'
}

$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir "flashbootInstall.ahk"
$ahkProc = Start-Process -FilePath $ahkExe `
                         -ArgumentList "`"$ahkFile`"" `
                         -PassThru

$ahkId = $ahkProc.Id
Write-Debug "$ahkExe start time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$ahkId"


Install-ChocolateyPackage @packageArgs