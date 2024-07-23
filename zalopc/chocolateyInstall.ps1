$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-24.7.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '3f4e38caa2db54fe819f6571c04c3fdf55694f7b12bf30c453610f2558e3945c' # 24.7.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
