$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.11.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '6c15cc04cab5b0b32e6e9980dd847db286491a35e24275b482102ad40ef7ce29' # 21.11.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs