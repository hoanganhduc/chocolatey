$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-24.8.4.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '16e4d4087d60a945acab1a69875cd44dfb7bbbef75706a07e0381a0f9b716015' # 24.8.4
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
