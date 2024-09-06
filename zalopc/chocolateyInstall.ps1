$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-ne-5.zadn.vn/win/ZaloSetup-24.8.5.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'f3a931da67fe23ca2d7c07964cf9fe0c40905829c0b20e684b3570ad78ee941b' # 24.8.5
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
