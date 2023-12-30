$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-23.12.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '0b589daa7a73ece9960e334c0b2a876a8dc5bb94cd98d714064cf437fa9024b0' # 23.12.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
