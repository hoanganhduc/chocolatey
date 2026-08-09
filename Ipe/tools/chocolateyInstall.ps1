$ErrorActionPreference = 'Stop'

$packageName = 'Ipe'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$packageParameters = Get-PackageParameters
$packageVersion = '7.2.29'
$packageMarker = Join-Path $toolsDir 'ipe.installroot.txt'

if ($packageParameters['InstallDir']) {
  $installRoot = $packageParameters['InstallDir']
} else {
  $installRoot = $env:SystemDrive
}

$targetDir = Join-Path $installRoot "ipe-$packageVersion"
$targetPath = Join-Path $targetDir 'bin\ipe.exe'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = 'Ipe extensible drawing editor'
  fileType       = 'zip'
  unzipLocation  = $installRoot
  url64bit       = "https://github.com/otfried/ipe/releases/download/v$packageVersion/ipe-$packageVersion-win64.zip"
  checksum64     = 'a4848ed0870b5d0a43e7009a6f4a2027d15b9d93c9e75c73ad9e77554c3e9852'
  checksumType64 = 'sha256'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

if (-not (Test-Path $targetPath -PathType Leaf)) {
  throw "Expected executable not found at '$targetPath'. Upstream archive layout may have changed."
}

Set-Content -Path $packageMarker -Value $targetDir -Encoding ASCII -Force

$startMenuShortcut = Join-Path $env:ProgramData 'Microsoft\Windows\Start Menu\Programs\Ipe.lnk'
$desktopShortcut = Join-Path $env:UserProfile 'Desktop\Ipe.lnk'

Install-ChocolateyShortcut -ShortcutFilePath $startMenuShortcut -TargetPath $targetPath
Install-ChocolateyShortcut -ShortcutFilePath $desktopShortcut -TargetPath $targetPath
