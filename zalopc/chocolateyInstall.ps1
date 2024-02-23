$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-zn-14.zadn.vn/win/ZaloSetup-24.2.1.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'a76716b02fcb592dbe0ecb2af1ed79c3e1bb4e2a1f46bf5729c9899c792b5846' # 24.2.1
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
