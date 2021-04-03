$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.3.3-u1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '2d91032ea61de46eccff1d6c77e4ba646a24733cd93ed6fea00b94678bdbe1e1' # 21.3.3-u1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs