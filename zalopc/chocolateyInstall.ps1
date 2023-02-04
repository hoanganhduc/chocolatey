$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-pt-4.zadn.vn/hybrid/ZaloSetup-23.1.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '1b474f30a83b9db9fb2bb282054c145355080350c8970496b094b61c0a31da5a' # 23.1.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
