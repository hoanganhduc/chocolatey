$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-22.5.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '657ce13cadfc17ccc53879fa8f79c96b387829d9062690c041f416e784ab50dd' # 22.5.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
