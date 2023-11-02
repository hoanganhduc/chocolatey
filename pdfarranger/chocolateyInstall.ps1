$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'pdfarranger'
  softwareName  = 'pdfarranger'
  fileType      = 'MSI'
  silentArgs    = ""
  url           = 'https://github.com/pdfarranger/pdfarranger/releases/download/1.10.0/pdfarranger-1.10.0-windows-installer.msi'
  checksum      = 'b77a5dc7c956f1e0986664b0587b9b7532ca304590f4f1c86b03960486dde4f6' # 1.10.0
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