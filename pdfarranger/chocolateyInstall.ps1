$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'pdfarranger'
  softwareName  = 'pdfarranger'
  fileType      = 'MSI'
  silentArgs    = ""
  url           = 'https://github.com/pdfarranger/pdfarranger/releases/download/1.8.2/pdfarranger-1.8.2-windows-installer.msi'
  checksum      = '22e8bb8afcbae7673863e47a009184b318aa612b1a1c8b8f49ef4b9e568d5311' # 1.8.2
  checksumType  = 'sha256'
}

$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir "pdfarrangerInstall.ahk"
$ahkProc = Start-Process -FilePath $ahkExe `
                         -ArgumentList "`"$ahkFile`"" `
                         -PassThru

$ahkId = $ahkProc.Id
Write-Debug "$ahkExe start time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$ahkId"

Install-ChocolateyPackage @packageArgs