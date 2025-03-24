$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-10.zadn.vn/win/ZaloSetup-25.3.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '8a49c6207d8d79f10ed8f7260d75cc4381bf8d99ea431970448c980924500839' # 25.3.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
