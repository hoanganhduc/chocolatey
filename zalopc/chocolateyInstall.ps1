$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.10.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '9da63f50a2b2c22a6c345df997a97d4de984b187d749a88ff505cd61f80b3b57' # 21.10.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs