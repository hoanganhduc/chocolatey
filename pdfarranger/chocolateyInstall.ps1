$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'pdfarranger'
  softwareName  = 'pdfarranger'
  fileType      = 'MSI'
  silentArgs    = ""
  url           = 'https://github.com/pdfarranger/pdfarranger/releases/download/1.7.0/pdfarranger-1.7.0-windows-installer.msi'
  # url           = 'https://github.com/pdfarranger/pdfarranger/releases/download/1.6.2/pdfarranger-1.6.2-windows-installer.msi'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'e40d1c876026d0fb6dcc06ca3588435b081bc31d8ee0a761fad931a07488fbc6' # 1.7.0
  # checksum      = 'fc01a47c9fc9404e70e8c984dee3b2c2259d9cfd8a5e967c66ab9c928253533e' # 1.6.2
  checksumType  = 'sha256'
}

Stop-Process -ProcessName "AutoHotkey*" -Force
$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir "pdfarrangerInstall.ahk"
$ahkProc = Start-Process -FilePath $ahkExe `
                         -ArgumentList "`"$ahkFile`"" `
                         -PassThru

$ahkId = $ahkProc.Id
Write-Debug "$ahkExe start time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$ahkId"

Install-ChocolateyPackage @packageArgs