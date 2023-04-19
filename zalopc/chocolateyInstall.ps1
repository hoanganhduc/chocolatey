$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-pt-4.zadn.vn/hybrid/ZaloSetup-23.4.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '8d34c9b85564fb6ff8535d85829dbb27d9629bde226ca4cf9c43f27f7f797ee2' # 23.4.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
