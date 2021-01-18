$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$installDir = Get-Content -Path "$toolsDir\installDir.txt"

Remove-Item $installDir -Recurse -Force -Confirm:$false
Remove-Item "${env:SystemDrive}\ProgramData\Microsoft\Windows\Start Menu\Programs\VieTeX.lnk" -Force -Confirm:$false

$desktopShortcut = "${env:UserProfile}\Desktop\VieTeX.lnk"
if (Test-Path $desktopShortcut -PathType leaf) {
	Remove-Item $desktopShortcut -Force -Confirm:$false
}