$ErrorActionPreference = 'Stop';

$pp = Get-PackageParameters

if ($pp['InstallDir']) {
	$installDir = $pp['InstallDir']
} else {
	$installDir = "${env:SystemDrive}"
}

$packageArgs = @{
  packageName    = 'Ipe'
  softwareName   = 'Ipe extensible drawing editor'
  fileType       = 'zip'
  unziplocation  = "$installDir"
  url            = 'https://github.com/otfried/ipe/releases/download/v7.2.24/ipe-7.2.24-win32.zip' # 7.2.24
  url64bit       = 'https://github.com/otfried/ipe/releases/download/v7.2.24/ipe-7.2.24-win64.zip' # 7.2.24
  validExitCodes = @(0, 3010, 1641)
  checksum       = 'd1441ef44c1f377c06d65dadda5932ae6ac21cf7e1f174d0517aae374e8dd5b0' # 7.2.24
  checksum64     = '0cb50e15d0ca82df77cfd30868e9360f83e7b7041366b89c98aa82c9f294be2c' # 7.2.24
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "${env:SystemDrive}\ProgramData\Microsoft\Windows\Start Menu\Programs\Ipe.lnk" -TargetPath "$installDir\ipe-7.2.24\bin\ipe.exe"
Install-ChocolateyShortcut -ShortcutFilePath "${env:UserProfile}\Desktop\Ipe.lnk" -TargetPath "$installDir\ipe-7.2.24\bin\ipe.exe"