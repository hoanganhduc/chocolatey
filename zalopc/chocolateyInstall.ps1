$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-22.5.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '5f288a81c4053e400fe06dd2ddb0d9b9e67b1e1ae94cbdb9dacaa11969337a20' # 22.5.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
