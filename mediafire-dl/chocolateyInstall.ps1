$ErrorActionPreference = 'Stop';

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName    = 'mediafire-dl'
  softwareName   = 'mediafire-dl'
  fileType       = 'zip'
  unziplocation  = "$toolsDir"
  url            = 'https://github.com/Juvenal-Yescas/mediafire-dl/archive/master.zip'
  url64bit       = 'https://github.com/Juvenal-Yescas/mediafire-dl/archive/master.zip'
  validExitCodes = @(0, 3010, 1641)
  checksum       = '8c4b3de2120140e1f2a0ba0d2bd5625e85626f2840fff64214ad90c80a4057d6'
  checksum64     = '8c4b3de2120140e1f2a0ba0d2bd5625e85626f2840fff64214ad90c80a4057d6'
  checksumType   = 'sha256'
}

pip install --disable-pip-version-check requests tqdm six pyinstaller

Install-ChocolateyZipPackage @packageArgs

$mediafiredlFile = Join-Path $toolsDir "mediafire-dl-master" | Join-Path -Child "mediafire-dl.py"
$pyinstBuidDir = Join-Path $toolsDir "mediafire-dl-master" | Join-Path -Child "build"

Start-Process pyinstaller -ArgumentList "--clean --onefile $mediafiredlFile --workpath $pyinstBuidDir --distpath $toolsDir" -NoNewWindow -PassThru -Wait