$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-23.10.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '426d9c0f3ff0e4b782e8254b669d25899ee892f0d86ceccd67cc45bbcb7889e8' # 23.10.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
