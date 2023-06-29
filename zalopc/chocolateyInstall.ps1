$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-23.6.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'c69179c0e50a420c2d1cadb4236112484dff910e7808b4f31b43592c4a431dfc' # 23.6.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
