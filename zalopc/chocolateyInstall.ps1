$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.11.4.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '7acee9d13d3eff924737dad248e0be26a1f1bf07d763e0311fd9267a7a1a51ef' # 21.11.3
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs