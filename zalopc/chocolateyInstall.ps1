$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-22.7.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '7f0150b43f6fa5034f6aa55b4d5dee3071e689fd736cf294708978aff96e353d' # 22.7.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
