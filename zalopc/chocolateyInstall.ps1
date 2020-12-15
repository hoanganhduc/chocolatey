$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  file          = $fileLocation
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-20.11.2.exe'
  validExitCodes= @(0)
  checksum      = '9242478f8e56f9981f81573428d67f868cfb161f640ae2550a09a6e4069ebd4d'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage $packageArgs