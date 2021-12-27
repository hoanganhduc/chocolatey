$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'pdfarranger'
  softwareName  = 'pdfarranger'
  fileType      = 'MSI'
  silentArgs    = ""
  url           = 'https://github.com/pdfarranger/pdfarranger/releases/download/1.8.1/pdfarranger-1.8.1-windows-installer.msi'
  checksum      = '920b67427a519f6c5ed51dc05b3f5e311ca9c4b4253e56b454759a3676994e92' # 1.8.1
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