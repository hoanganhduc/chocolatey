$ErrorActionPreference = 'Stop'; # stop on all errors

$shell = New-Object -COM WScript.Shell
$shortcutPath = "${env:SystemDrive}\ProgramData\Microsoft\Windows\Start Menu\Programs\TpX-1.5.lnk"
$installDir = $shell.CreateShortcut($shortcutPath).TargetPath | Split-Path -parent

Remove-Item $installDir -Recurse -Force -Confirm:$false
Remove-Item $shortcutPath -Recurse -Force -Confirm:$false

$desktopShortcut = "${env:UserProfile}\Desktop\TpX-1.5.lnk"
if (Test-Path $desktopShortcut -PathType leaf) {
	Remove-Item $desktopShortcut -Force -Confirm:$false
}
