$ErrorActionPreference = 'Stop';

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName    = 'mediafire-dl'
  softwareName   = 'mediafire-dl'
  fileType       = 'zip'
  unziplocation  = "$toolsDir"
  url            = 'https://github.com/Juvenal-Yescas/mediafire-dl/archive/master.zip'
  validExitCodes = @(0, 3010, 1641)
  checksum       = '540516937c7cad9b168042af1d47130231b57a07517f5411b5f0e6fcd7f17321'
  checksumType   = 'sha256'
}

pip install --disable-pip-version-check requests tqdm six pyinstaller

Install-ChocolateyZipPackage @packageArgs

$mediafiredlFile = Join-Path $toolsDir "mediafire-dl-master" | Join-Path -Child "mediafire-dl.py"
$pyinstBuidDir = Join-Path $toolsDir "mediafire-dl-master" | Join-Path -Child "build"

Start-Process pyinstaller -ArgumentList "--clean --onefile $mediafiredlFile --workpath $pyinstBuidDir --distpath $toolsDir" -NoNewWindow -PassThru -Wait