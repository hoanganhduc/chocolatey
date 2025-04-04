$Strawberry = "C:\Strawberry"
$env:Path = "$Strawberry\c\bin;$Strawberry\perl\site\bin;$Strawberry\perl\bin;$Env:Path"

& cpanm --showdeps LaTeXML@$Env:ChocolateyPackageVersion

& cpanm LaTeXML@$Env:ChocolateyPackageVersion

Get-Command latexml | Select-Object -ExpandProperty Definition
