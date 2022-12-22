$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-pt-1.zadn.vn/hybrid/ZaloSetup-22.12.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'c3e9608af11d5ed65925e4319ff0db5178140078c3e501ffdf9f601c8be5b322' # 22.12.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
