$ErrorActionPreference = 'Stop';

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName    = 'arxiv-collector'
  softwareName   = 'arxiv-collector'
  fileType       = 'zip'
  unziplocation  = "$toolsDir"
  url            = 'https://github.com/djsutherland/arxiv-collector/archive/refs/tags/0.4.1.zip'
  validExitCodes = @(0, 3010, 1641)
  checksum       = '2dfde70d761b347b5d430bfb35d3acee6dd3493f57316f7dd62909ad82167fd5'
  checksumType   = 'sha256'
}

pip install --disable-pip-version-check pyinstaller

Install-ChocolateyZipPackage @packageArgs

$installFile = Join-Path $toolsDir "arxiv-collector-0.4.1" | Join-Path -Child "arxiv_collector.py"
$pyinstBuidDir = Join-Path $toolsDir "arxiv-collector-0.4.1" | Join-Path -Child "build"

Start-Process pyinstaller -ArgumentList "--clean --onefile $installFile --workpath $pyinstBuidDir --distpath $toolsDir -n arxiv-collector" -NoNewWindow -PassThru -Wait