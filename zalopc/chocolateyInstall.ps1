$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-23.11.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '8a3120612ab478b55ceaec1981252a89fa5110ddb19043774d72ec6c786b3209' # 23.11.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
