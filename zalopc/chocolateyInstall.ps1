$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.6.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '106c96fb7dbe2f99747c786f5d9503bff54c02f4fe292bbecd3b63a8f6b6387a' # 21.6.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs