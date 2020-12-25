$ErrorActionPreference = 'Stop'; # stop on all errors

$shell = New-Object -COM WScript.Shell
$shortcutPath = "${env:SystemDrive}\ProgramData\Microsoft\Windows\Start Menu\Programs\VieTeX.lnk"
$installDir = $shell.CreateShortcut($shortcutPath).TargetPath | Split-Path -parent

Remove-Item $installDir -Recurse -Force -Confirm:$false
Remove-Item $shortcutPath -Force -Confirm:$false

$desktopShortcut = "${env:UserProfile}\Desktop\VieTeX.lnk"
if (Test-Path $desktopShortcut -PathType leaf) {
	Remove-Item $desktopShortcut -Force -Confirm:$false
}