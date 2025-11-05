$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-ne-5.zadn.vn/win/ZaloSetup-25.10.3.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '0798f51f4f0a39fc8854f659ac5ead070447886bdc479e5805de859a1afec809' # 25.10.3
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
