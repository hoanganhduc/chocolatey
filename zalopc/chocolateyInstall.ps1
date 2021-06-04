$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.5.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '17c848368a4b1cc708d5424056154d825a2ad9e53f34a7677d5ba6911153bb4b' # 21.5.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs