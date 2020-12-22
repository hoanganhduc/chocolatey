$ErrorActionPreference = 'Stop';

$pp = Get-PackageParameters

if ($pp['InstallDir']) {
	$installDir = $pp['InstallDir']
} else {
	$installDir = "${env:SystemDrive}\tpx"
}

$packageArgs = @{
  packageName    = 'tpx'
  softwareName   = 'TpX'
  fileType       = 'zip'
  unziplocation  = "$installDir"
  url            = 'https://sourceforge.net/projects/tpx/files/tpx/TpX%201.5/TpX_ExecDistribution1_5.zip'
  url64bit       = 'https://sourceforge.net/projects/tpx/files/tpx/TpX%201.5/TpX_ExecDistribution1_5.zip'
  validExitCodes = @(0, 3010, 1641)
  checksum       = '2833ef95bda1d033ccb4fce2ad2c11830cba8ef8b5f3d405199ade807a099fac'
  checksum64     = '2833ef95bda1d033ccb4fce2ad2c11830cba8ef8b5f3d405199ade807a099fac'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "${env:UserProfile}\Desktop\TpX-1.5.lnk" -TargetPath "$installDir\TpX.exe"
Install-ChocolateyShortcut -ShortcutFilePath "${env:SystemDrive}\ProgramData\Microsoft\Windows\Start Menu\Programs\TpX-1.5.lnk" -TargetPath "$installDir\TpX.exe"