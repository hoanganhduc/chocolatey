$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'pdfarranger'
  softwareName   = 'PDF Arranger*'
  fileType       = 'msi'
  silentArgs     = '/qn /norestart'
  url            = 'https://github.com/pdfarranger/pdfarranger/releases/download/1.13.0/pdfarranger-1.13.0-windows-installer.msi'
  checksum       = '743ad5fc43b9eddaa4bd1c98678c06cf1d3576905751d1570d1a38ef9a9fcc0e'
  checksumType   = 'sha256'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
