$ErrorActionPreference = 'Stop';

$pp = Get-PackageParameters
$pkgver = "7.2.27"

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
  checksum64     = 'e3ef969f48eb000c8a6c4445cc4ebc2e582f50b601794c6dc1fb4ef459734db3'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "${env:SystemDrive}\ProgramData\Microsoft\Windows\Start Menu\Programs\Ipe.lnk" -TargetPath "$installDir\ipe-$pkgver\bin\ipe.exe"
Install-ChocolateyShortcut -ShortcutFilePath "${env:UserProfile}\Desktop\Ipe.lnk" -TargetPath "$installDir\ipe-$pkgver\bin\ipe.exe"