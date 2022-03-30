$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-22.3.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '0b8c5ab583e9113b9ff5076ecf1d22bcb73b41f378957825b38eab682fd1f190' # 22.3.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
