$ErrorActionPreference = 'Stop'; # stop on all errors

$installDir = "${env:SystemDrive}\vietex"

Remove-Item $installDir = "${env:SystemDrive}\vietex" -Recurse -Force -Confirm:$false
Remove-Item "${env:UserProfile}\Desktop\VieTeX.lnk" -Force -Confirm:$false