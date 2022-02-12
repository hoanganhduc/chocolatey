$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-22.1.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '5a6d3e5a7eb8ad4dd4ee1e0ef70695bb538fbd0f9f27ceac2421b95cd62df0cd' # 22.1.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
