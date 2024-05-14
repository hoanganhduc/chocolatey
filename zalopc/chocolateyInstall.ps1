$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-24.5.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '2c0d1d6b6e073437dcca2af2878780a34cea1b0b3fd0581cf8dd1185e76ac0d8' # 24.4.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
