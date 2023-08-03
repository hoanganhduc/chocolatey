$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-23.7.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '837ab9d8d8988fbc648d14826c41da59fefd1ded537bbcf14ecf73f1cf0e371d' # 23.7.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
