$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.3.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '85a72947c3381602440088e178e3743690504ee13a4f41ae98e38aa40f126b1c' # 21.3.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs