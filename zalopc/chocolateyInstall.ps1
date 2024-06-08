$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-24.6.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'f45d175a3bc6a16d29b36fc7721d5e15bd9b5e57e2456e3297cbe8755d0d938d' # 24.6.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
