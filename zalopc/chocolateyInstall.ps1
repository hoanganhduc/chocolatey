$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-ne-5.zadn.vn/win/ZaloSetup-25.8.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'e5a63aca1f18543a84536bb74302523a069ac30dc8c98f642c8ca1d9336681be' # 25.8.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
