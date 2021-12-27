$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.12.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '46e918b6ed7db0b72c5e847dc8c44b31ab0592ebb08f6d28c8472e7a18dc9d36' # 21.12.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs