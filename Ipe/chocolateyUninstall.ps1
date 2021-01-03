$ErrorActionPreference = 'Stop'; # stop on all errors

$shell = New-Object -COM WScript.Shell
$shortcutPath = "${env:SystemDrive}\ProgramData\Microsoft\Windows\Start Menu\Programs\Ipe.lnk"
$installDir = $shell.CreateShortcut($shortcutPath).TargetPath | Split-Path -parent | Split-Path -parent

Remove-Item $installDir -Recurse -Force -Confirm:$false
Remove-Item $shortcutPath -Recurse -Force -Confirm:$false

$desktopShortcut = "${env:UserProfile}\Desktop\Ipe.lnk"
if (Test-Path $desktopShortcut -PathType leaf) {
	Remove-Item $desktopShortcut -Force -Confirm:$false
}