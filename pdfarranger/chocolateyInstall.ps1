$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'pdfarranger'
  softwareName  = 'pdfarranger'
  fileType      = 'MSI'
  silentArgs    = ""
  url           = 'https://github.com/pdfarranger/pdfarranger/releases/download/1.8.0/pdfarranger-1.8.0-windows-installer.msi'
  checksum      = '3478994f8c4c4043a82cc4920cced4f4a155661cdcfe9120210d009b811d4804' # 1.8.0
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