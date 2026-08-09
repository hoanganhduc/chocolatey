$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc.zadn.vn/win/ZaloSetup-26.8.10.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '5aaf4ada0ac3d42cc2dc7bcf780f939b0e9abe88ebbcf5d40c263b0dc57ed88d' # 26.8.10
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
