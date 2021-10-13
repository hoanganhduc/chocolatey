$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.10.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '2b490cadbad4d3498c2ff02353b59251e4aa865dc29b678f7870fb9bad74d468' # 21.10.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs