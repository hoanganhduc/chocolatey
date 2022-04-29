$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-22.4.3.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '938b039c2a41f3e7df1168c0b9914f632e87ec3d004f7c6968e53d82b19cde7b' # 22.4.3
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
