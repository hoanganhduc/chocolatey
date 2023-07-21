$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-23.6.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '8ba53d033009e3ec280f41f74249f47829f84cb4a12d90398253e87158c2f8b1' # 23.6.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
