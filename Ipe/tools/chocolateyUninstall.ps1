$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$packageMarker = Join-Path $toolsDir 'ipe.installroot.txt'
$targetDir = $null

if (Test-Path $packageMarker -PathType Leaf) {
  $targetDir = Get-Content $packageMarker -ErrorAction SilentlyContinue | Select-Object -First 1
}

if ($targetDir -and (Test-Path $targetDir -PathType Container)) {
  Remove-Item $targetDir -Recurse -Force -Confirm:$false
}

$startMenuShortcut = Join-Path $env:ProgramData 'Microsoft\Windows\Start Menu\Programs\Ipe.lnk'
$desktopShortcut = Join-Path $env:UserProfile 'Desktop\Ipe.lnk'

foreach ($shortcutPath in @($startMenuShortcut, $desktopShortcut)) {
  if (Test-Path $shortcutPath -PathType Leaf) {
    Remove-Item $shortcutPath -Force -Confirm:$false
  }
}

if (Test-Path $packageMarker -PathType Leaf) {
  Remove-Item $packageMarker -Force -Confirm:$false
}
