$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-23.5.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '3f1dd2c2be29ae0c391348b7965311dedad5cad9266320b8b391828235c3341d' # 23.5.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
