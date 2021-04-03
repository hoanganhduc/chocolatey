$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'flashboot'
  softwareName  = 'FlashBoot'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://flashboot-v3.prime-expert.com/flashboot-3.3g-setup.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '92531b0649e007f44461445d1e31a44bfedb524ea4b1eaa5b635197f264aefa7' # 3.3g
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