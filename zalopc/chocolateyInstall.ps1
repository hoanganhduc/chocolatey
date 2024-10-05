$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnno-ne-5.zadn.vn/win/ZaloSetup-24.9.4.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '7bf5263be5bd6256cfd26ba09b205ccaf7a57be044652e838fbf3b9b15724f4c' # 24.9.4
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
