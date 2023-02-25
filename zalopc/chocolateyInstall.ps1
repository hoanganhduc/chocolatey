$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-pt-4.zadn.vn/hybrid/ZaloSetup-23.2.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '0e323efd6271704f5c40b547ff943dc0a212e6bc1a9bb1cb1e5765db3c0ce974' # 23.2.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
