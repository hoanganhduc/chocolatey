$Strawberry = "C:\Strawberry"
$env:Path = "$Strawberry\c\bin;$Strawberry\perl\site\bin;$Strawberry\perl\bin;$Env:Path"

& $Strawberry\perl\bin\cpanm.bat --verbose --uninstall --force LaTeXML@$Env:ChocolateyPackageVersion