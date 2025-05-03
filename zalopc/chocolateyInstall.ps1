$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-10.zadn.vn/win/ZaloSetup-25.4.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'f9f5240c53c4cf259d55a096ca031d93ff0c91146209208a7cae0d3f091b8286' # 25.4.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
