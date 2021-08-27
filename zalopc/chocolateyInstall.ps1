$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup_21.8.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'd4a8db6b8c588cc1b9ff0e522a270f8a17116dca5e4791c90e31189705fcc9d0' # 21.8.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs