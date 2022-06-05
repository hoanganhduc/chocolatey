$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-22.5.3.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'a485158571e05ed81115cbd3569ad53ab294f9aa01253c9335dd100172f3498b' # 22.5.3
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
