$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.4.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '163782e112336d1b49e5266684f1dd860d1cd52deb050cdb4811365b6908b30c' # 21.4.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs