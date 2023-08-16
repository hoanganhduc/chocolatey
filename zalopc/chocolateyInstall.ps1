$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-23.8.3.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '1d69ed8a5174366cd81f3637585658a4b2e788bbfbe3bb91301b6851d1f85422' # 23.8.3
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
