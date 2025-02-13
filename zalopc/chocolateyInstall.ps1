$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-download-pc-te-vnso-pt-24.zadn.vn/win/ZaloSetup-25.1.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = '3e646bb5e130a672832d99b60bf14a3ee9c2b7af5bc7ef22590648aa7a8be195' # 25.1.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
