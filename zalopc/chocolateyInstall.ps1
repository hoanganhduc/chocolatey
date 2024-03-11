$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-24.2.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '235834887c46609329bcc9e77d7e10d5e481e7b9db09e8c091ab181757d29a2a' # 24.2.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
