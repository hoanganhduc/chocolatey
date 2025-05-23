$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-ne-5.zadn.vn/win/ZaloSetup-25.5.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '219acdf2a45927fedaadbef0b87b31137af4cf94e10a6a5d4f9fe96c169ebac0' # 25.5.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
