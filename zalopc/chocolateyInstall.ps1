$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.7.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '5123da8abe7b20e0794e3c77f55be45e3ccf0a43751e98485fddb6894aa52aef' # 21.7.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs