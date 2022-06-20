$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-22.6.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'f98ff62abde01a1f01506e80e4f1bee6a368668b995bc9db41c0b5acc05cee12' # 22.6.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
