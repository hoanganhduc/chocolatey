$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-22.4.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '47ef235360c6ea301be790606ce859da4f0a66ba1b31ffc89c84615ec5bd059b' # 22.4.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
