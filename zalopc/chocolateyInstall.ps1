$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.11.3.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'b9627c386fa3e55f523508627a8a03f4ec8ebf9758d588acf3d9388877b63f02' # 21.11.3
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs