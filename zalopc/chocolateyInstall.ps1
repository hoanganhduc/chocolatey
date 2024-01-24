$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-24.1.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '0c6859dd839d8978feab1924645a043f514459b793a9b496537840043a6216b3' # 24.1.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
