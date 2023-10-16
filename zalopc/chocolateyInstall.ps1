$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-23.10.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '608b75ab26b9851f04c94187cb246481ae793134081d444ed46dc58fad2108eb' # 23.10.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
