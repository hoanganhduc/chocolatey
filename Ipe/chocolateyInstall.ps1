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
  url            = 'https://github.com/otfried/ipe/releases/download/v7.2.25/ipe-7.2.25-win32.zip' # 7.2.25 32-bit
  url64bit       = 'https://github.com/otfried/ipe/releases/download/v7.2.25/ipe-7.2.25-win64.zip' # 7.2.25 64-bit
  validExitCodes = @(0, 3010, 1641)
  checksum       = '7bee958367974afeb7f36f9f80bf02bef90878243a9ba9d7f47a74edeb12bf62' # 7.2.24 32-bit
  checksum64     = '34ee93e31e4caaf471784bb8105f80518fbfccb0c32557fc1949f6bd7dfcacd7' # 7.2.24 64-bit
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "${env:SystemDrive}\ProgramData\Microsoft\Windows\Start Menu\Programs\Ipe.lnk" -TargetPath "$installDir\ipe-7.2.25\bin\ipe.exe"
Install-ChocolateyShortcut -ShortcutFilePath "${env:UserProfile}\Desktop\Ipe.lnk" -TargetPath "$installDir\ipe-7.2.25\bin\ipe.exe"