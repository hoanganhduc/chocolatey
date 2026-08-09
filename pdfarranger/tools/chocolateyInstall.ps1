$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'pdfarranger'
  softwareName   = 'PDF Arranger*'
  fileType       = 'msi'
  silentArgs     = '/qn /norestart'
  url            = 'https://github.com/pdfarranger/pdfarranger/releases/download/1.14.0/pdfarranger-1.14.0-windows-installer.msi'
  checksum       = '33ba1c3028cc81eb364b8eed288389fc8a4869c015ce817b9408a3d31e0e90b0'
  checksumType   = 'sha256'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
