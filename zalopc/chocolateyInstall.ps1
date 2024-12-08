$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-ne-5.zadn.vn/win/ZaloSetup-24.12.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'f5564aa46433dca0fc12792db65ffe1977f3646507811d260d20bf738a726a52' # 24.12.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
