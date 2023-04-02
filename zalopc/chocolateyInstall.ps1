$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-pt-4.zadn.vn/hybrid/ZaloSetup-23.3.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '673d4563efcc62fa92d5b9e81201e96ff5ef2ec6f44fbed0ad22a5d2cfd6a8f1' # 23.3.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
