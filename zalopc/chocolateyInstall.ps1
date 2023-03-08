$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-pt-4.zadn.vn/hybrid/ZaloSetup-23.2.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '1d8623e92e7fa9c120fab9510a4c729ca2c8e43e179071f51f9da5edbff83848' # 23.2.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
