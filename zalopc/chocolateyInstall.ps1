$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-20.12.1.exe'
  url64bit      = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-20.12.1.exe'
  validExitCodes= @(0)
  checksum      = 'd0234805d47f06d278774cbf6fb340fcb9048de08f7b973cc9bd0049ac1c0200'
  checksum64    = 'd0234805d47f06d278774cbf6fb340fcb9048de08f7b973cc9bd0049ac1c0200'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs