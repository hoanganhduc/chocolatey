$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-cm-9.zadn.vn/win/ZaloSetup-26.1.10.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '919d6d7b4aa93fc6dd6b80f54c1127ea3646917bc01aea5fd262032ec5c5dce9' # 26.1.10
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
