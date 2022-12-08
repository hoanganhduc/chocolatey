$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-pt-1.zadn.vn/hybrid/ZaloSetup-22.11.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'd8cbf928f5bc0bb5eda21b1998da26c89bfed840db529152a2d4f1453aa7c80a' # 22.11.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
