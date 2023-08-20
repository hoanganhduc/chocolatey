$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-23.8.4.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'c03652d4aec326a9550a0ddfd5e5ae1a43cdeb2979877d0594073327a97819d6' # 23.8.4
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
