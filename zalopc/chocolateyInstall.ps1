$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-ne-5.zadn.vn/win/ZaloSetup-24.11.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'c90e4b1efea8e53c295ae81edb7784bb3296f25fb3fe5a005de15835f12e2d41' # 24.11.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
