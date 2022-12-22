$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-pt-1.zadn.vn/hybrid/ZaloSetup-22.12.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'd2dde49028a3f6bb4bc5443d0135b6a56d7dba1ac23ac6945976151fed13ee6d' # 22.12.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
