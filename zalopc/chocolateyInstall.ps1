$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-24.4.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'b707d16203ada80eefb5392809b42c444b26239ee963342dbdda3ca33fad9ffd' # 24.4.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
