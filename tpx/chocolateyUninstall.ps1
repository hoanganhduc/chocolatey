$ErrorActionPreference = 'Stop'; # stop on all errors

$installDir = "${env:SystemDrive}\tpx"

Remove-Item $installDir -Recurse -Force -Confirm:$false
Remove-Item "${env:UserProfile}\Desktop\TpX-1.5.lnk" -Force -Confirm:$false