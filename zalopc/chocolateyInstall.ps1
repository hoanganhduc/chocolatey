$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-ne-6.zadn.vn/win/ZaloSetup_24.12.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'a99ffe9f7da2375b70408d9d40097ce664eb8881d6837cbda064e16dba64341d' # 24.12.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
