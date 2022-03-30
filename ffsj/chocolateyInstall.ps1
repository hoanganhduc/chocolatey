$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'ffsj'
  softwareName  = 'ffsj'
  fileType      = 'exe'
  silentArgs    = ""
  url           = 'http://www.fastfilejoiner.com/FSJSetup.exe'
  checksum      = 'd3502562bf077167ad654cdc406cd078e286cbc241d8181d4f3294c7f7356d15' # 3.3
  checksumType  = 'sha256'
}

$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir "ffsjInstall.ahk"
$ahkProc = Start-Process -FilePath $ahkExe `
                         -ArgumentList "`"$ahkFile`"" `
                         -PassThru

$ahkId = $ahkProc.Id
Write-Debug "$ahkExe start time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$ahkId"

Install-ChocolateyPackage @packageArgs