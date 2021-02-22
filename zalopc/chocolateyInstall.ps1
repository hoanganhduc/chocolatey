$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup-21.2.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '065a0ea034f7ad921b40cfad3c4597fe5ee4f6af64b4570d32e7e9fad65a0764' # 21.2.1
  # checksum      = 'c5f997433f8fedc1b54fac1c670647c594bf24b3d484d0e07798fcda8f369410' # 21.1.2
  # checksum      = '3a593d2b6e0c900a47117327f16949b79503df0ceed038e0674310705bb416aa' # 21.1.1
  # checksum      = 'd0234805d47f06d278774cbf6fb340fcb9048de08f7b973cc9bd0049ac1c0200' # 20.12.1
  # checksum      = '9242478f8e56f9981f81573428d67f868cfb161f640ae2550a09a6e4069ebd4d' # 20.11.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs