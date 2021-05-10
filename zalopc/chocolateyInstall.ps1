$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.4.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'cff48b375597953ccaafd1c8633469b131d2e227638903929c7668ec1077f8f8' # 21.4.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs