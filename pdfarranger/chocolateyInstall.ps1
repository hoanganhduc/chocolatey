$ErrorActionPreference = 'Stop';

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = 'pdfarranger'
  softwareName  = 'pdfarranger'
  fileType      = 'MSI'
  silentArgs    = ""
  url           = 'https://github.com/pdfarranger/pdfarranger/releases/download/1.12.1/pdfarranger-1.12.1-windows-installer.msi'
  checksum      = 'ae817d97290fd3400bd410b9f1b937343d077c3492a18c51c59c26202f081c5d' # 1.12.1
  checksumType  = 'sha256'
}

# Kill any existing AutoHotkey processes running pdfarrangerInstall.ahk
Get-Process | Where-Object {
  $_.Name -eq "AutoHotKey" -or $_.Name -eq "AutoHotkey" -or $_.Name -eq "AutoHotkeyU32" -or $_.Name -eq "AutoHotkeyU64"
} | ForEach-Object {
  $cmdLine = Get-CimInstance -ClassName Win32_Process -Filter "ProcessId = $($_.Id)" | Select-Object -ExpandProperty CommandLine
  if ($cmdLine -like "*pdfarrangerInstall.ahk*") {
    Write-Debug "Stopping existing AutoHotkey process (ID: $($_.Id)) running pdfarrangerInstall.ahk"
    Stop-Process -Id $_.Id -Force
  }
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