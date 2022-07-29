$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'zalopc'
  softwareName  = 'Zalo PC'
  fileType      = 'exe'
  silentArgs    = "/S"
  url           = 'https://res-zaloapp-aka.zdn.vn/hybrid/ZaloSetup_22.7.2.exe'
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'ccea0c766a4f4bb922ba4dab800e051fce95e8ef1895aad7524ea6c851c76546' # 22.7.2
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
