$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-ne-5.zadn.vn/win/ZaloSetup-24.10.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '8a595ee74c9f854c8a4033f966d21ee9672c3cfb6f58e2b35e4afc43d124e4b5' # 24.10.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
