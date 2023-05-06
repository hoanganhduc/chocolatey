$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-pt-4.zadn.vn/hybrid/ZaloSetup-23.4.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '45d4153a208b3f3d1727db75f1f5c406a0f73320aa4ab1b0c5649a2ecd8ba927' # 23.4.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
