$ErrorActionPreference = 'Stop';

$pp = Get-PackageParameters

if ($pp['InstallDir']) {
	$installDir = $pp['InstallDir']
} else {
	$installDir = "${env:SystemDrive}\wintpic"
}

$packageArgs = @{
  packageName    = 'wintpic'
  softwareName   = 'WinTpic'
  fileType       = 'zip'
  unziplocation  = $installDir
  url            = 'http://aogaeru-lab.my.coocan.jp/program/WTPIC432a.zip'
  url64bit       = 'http://aogaeru-lab.my.coocan.jp/program/WTPIC432a.zip'
  validExitCodes = @(0, 3010, 1641)
  checksum       = '70b4bc51b1e56f7871f08b479f6e8ea6d29136ce94d1ddee4db25e66f3631dc2'
  checksum64     = '70b4bc51b1e56f7871f08b479f6e8ea6d29136ce94d1ddee4db25e66f3631dc2'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "${env:UserProfile}\Desktop\WinTpic-4.32a.lnk" -TargetPath "$installDir\WTPIC.exe"
Install-ChocolateyShortcut -ShortcutFilePath "${env:SystemDrive}\ProgramData\Microsoft\Windows\Start Menu\Programs\WinTpic-4.32a.lnk" -TargetPath "$installDir\WTPIC.exe"