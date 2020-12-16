$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'Ipe'
  softwareName   = 'Ipe extensible drawing editor'
  fileType       = 'zip'
  unziplocation  = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  url            = 'https://dl.bintray.com/otfried/generic/ipe/7.2/ipe-7.2.21-win32.zip'
  url64bit       = 'https://dl.bintray.com/otfried/generic/ipe/7.2/ipe-7.2.21-win64.zip'
  validExitCodes = @(0)
  checksum       = 'ee9c9824cf7e6834599020c7700a20aec718c4a599403981ba8c6f931bca1639'
  checksum64     = '1b512351bd4c2ae4b8bb2def76f746bfe168fe5df6e40728f9e99be50fcf4c9d'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "${env:UserProfile}\Desktop\Ipe-7.2.21.lnk" -TargetPath "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\\ipe-7.2.21\bin\ipe.exe"