$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$fileLocation = Join-Path $toolsDir "vietex41.zip"
$exefileLocation = Join-Path $toolsDir "vietex40.exe"

$packageArgs = @{
  packageName    = 'vietex'
  softwareName   = 'VieTeX'
  fileType       = 'exe'
  unziplocation  = "$toolsDir"
  file           = $exefileLocation
  file64         = $exefileLocation
  validExitCodes = @(0, 3010, 1641)
  checksum       = 'e5a379e146eb8808b95414574550d8116fc4bd75824751299d498adfd92fb21f'
  checksum64     = 'e5a379e146eb8808b95414574550d8116fc4bd75824751299d498adfd92fb21f'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

if(!(Test-Path $fileLocation -PathType leaf))
{
	cd $toolsDir
	Start-Process mediafire-dl -ArgumentList "http://www.mediafire.com/download/u2z7mxhxfh1f4yg/vietex41.zip" -NoNewWindow -PassThru -Wait
}

Start-Process 7z -ArgumentList "x $fileLocation -y -o$toolsDir" -NoNewWindow -PassThru -Wait
Remove-Item $fileLocation -Force -Confirm:$false
Install-ChocolateyZipPackage @packageArgs
Remove-Item $exefileLocation -Force -Confirm:$false
Install-ChocolateyShortcut -ShortcutFilePath "${env:UserProfile}\Desktop\VieTeX.lnk" -TargetPath "$toolsDir\\vietex.exe"