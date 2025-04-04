$ErrorActionPreference = 'Stop';

$pp = Get-PackageParameters
$pkgver = "7.2.29"

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
  url64bit       = "https://github.com/otfried/ipe/releases/download/v$pkgver/ipe-$pkgver-win64.zip"
  validExitCodes = @(0, 3010, 1641)
  checksum64     = 'a4848ed0870b5d0a43e7009a6f4a2027d15b9d93c9e75c73ad9e77554c3e9852'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "${env:SystemDrive}\ProgramData\Microsoft\Windows\Start Menu\Programs\Ipe.lnk" -TargetPath "$installDir\ipe-$pkgver\bin\ipe.exe"
Install-ChocolateyShortcut -ShortcutFilePath "${env:UserProfile}\Desktop\Ipe.lnk" -TargetPath "$installDir\ipe-$pkgver\bin\ipe.exe"