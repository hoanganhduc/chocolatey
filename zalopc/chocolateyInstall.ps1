$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.6.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'fb1f253591e1e64751acae9b2d8c92349a299ba1875b16cc6da086951be30f15' # 21.6.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs