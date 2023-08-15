$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-23.8.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'dc8944e629ceeb99ded2f4c00207d6517209b748720c0dd81db6ec6cbccea8f1' # 23.8.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
