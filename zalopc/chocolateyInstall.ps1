$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.9.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '83e0307a46d7e2e91426c0dca181eee3d0b0ad0e7432a50444f32cd45095c254' # 21.9.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs