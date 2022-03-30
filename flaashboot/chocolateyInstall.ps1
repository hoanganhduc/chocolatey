$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'flashboot'
  softwareName  = 'FlashBoot'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://flashboot-v3.prime-expert.com/flashboot-3.3k-setup.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '1b6092dba22cf6124bb08b7ded1b0b5055fb992dd641fc884a54485b72962679' # 3.3k
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