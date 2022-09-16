$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-22.9.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '45ac7ab580886a077d5a87a34af3a2c23f0a50789e106ce20cc0a752e5ccc548' # 22.9.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
