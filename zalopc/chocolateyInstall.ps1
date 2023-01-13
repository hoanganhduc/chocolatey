$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-pt-1.zadn.vn/hybrid/ZaloSetup-22.12.3.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '8af47f6535e82efc9d4d851b2bbdee7ffb94b141ba9c7cec5435ffad48cbe382' # 22.12.3
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
