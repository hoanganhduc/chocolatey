$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'pdfarranger'
  softwareName  = 'pdfarranger'
  fileType      = 'msi'
  unziplocation  = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  silentArgs    = "/S"
  url           = 'https://github.com/pdfarranger/pdfarranger/releases/download/1.6.2/pdfarranger-1.6.2-windows-installer.msi'
  url64bit      = 'https://github.com/pdfarranger/pdfarranger/releases/download/1.6.2/pdfarranger-1.6.2-windows-installer.msi'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'fc01a47c9fc9404e70e8c984dee3b2c2259d9cfd8a5e967c66ab9c928253533e'
  checksum64    = 'fc01a47c9fc9404e70e8c984dee3b2c2259d9cfd8a5e967c66ab9c928253533e'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs