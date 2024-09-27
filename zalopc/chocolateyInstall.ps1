$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-ne-5.zadn.vn/win/ZaloSetup-24.9.3.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '2a5fd2f3399c4d6ea7e19687199c8af665282ee5e66a478b03424462c3eee12b' # 24.9.3
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
