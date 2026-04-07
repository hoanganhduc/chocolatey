$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-cm-9.zadn.vn/win/ZaloSetup-26.3.20.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '59de07d9a03960cdeab00ee53e2903b44587befce0394ec24ce9b6a20cd9ee3a' # 26.3.20
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
