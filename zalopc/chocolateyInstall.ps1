$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-22.10.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '334be99b1e043439b9d20b5c9b1f685bf4bc0dda8c29ee93c4b69ea3314f6fc3' # 22.10.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
