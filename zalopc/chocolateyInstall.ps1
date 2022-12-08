$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-pt-1.zadn.vn/hybrid/ZaloSetup-22.11.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '4c0d3ba21eded33c9b1a4ca0c5243a9d3495a301fcc1bd1c6a429481e7c0e0d9' # 22.11.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
