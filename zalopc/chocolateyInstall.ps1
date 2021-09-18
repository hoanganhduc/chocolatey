$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.9.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '4a24b0e944bb22f6e5ab0abfbc42f224085d97dafce153ec34f3a504917b4028' # 21.9.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs