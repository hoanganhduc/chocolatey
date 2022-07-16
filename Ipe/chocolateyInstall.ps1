$ErrorActionPreference = 'Stop';

$pp = Get-PackageParameters
$pkgver = "7.2.26"

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
  url            = "https://github.com/otfried/ipe/releases/download/v$pkgver/ipe-$pkgver-win32.zip"
  url64bit       = "https://github.com/otfried/ipe/releases/download/v$pkgver/ipe-$pkgver-win64.zip"
  validExitCodes = @(0, 3010, 1641)
  checksum       = '3e67e901587508b20e8daf1c311c90036acc6408cc6fdc5b75b4cf32d973e772' 
  checksum64     = '8e175570d8e0a83dfc490bbb9115f07196b015d4d249af64417c2faeffff3834'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "${env:SystemDrive}\ProgramData\Microsoft\Windows\Start Menu\Programs\Ipe.lnk" -TargetPath "$installDir\ipe-$pkgver\bin\ipe.exe"
Install-ChocolateyShortcut -ShortcutFilePath "${env:UserProfile}\Desktop\Ipe.lnk" -TargetPath "$installDir\ipe-$pkgver\bin\ipe.exe"