$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.11.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '8b91158a615b584990bffe300860db88ed9934f09c90f79a5c7addb78e651c96' # 21.11.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs