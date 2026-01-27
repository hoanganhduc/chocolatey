$Strawberry = "C:\Strawberry"
$env:Path = "$Strawberry\c\bin;$Strawberry\perl\site\bin;$Strawberry\perl\bin;$Env:Path"

& cpanm --showdeps LaTeXML@$Env:ChocolateyPackageVersion

# LaTeXML 0.8.8 tests are brittle on Windows/TeX Live 2024:
# path separators and font metadata differ, causing failing tests.
# Set LATEXML_RUN_TESTS=1 to run tests with a Windows-normalizing patch.
if ($env:LATEXML_RUN_TESTS -eq "1") {
  $patchRoot = Join-Path $PSScriptRoot "patches"
  $patchOpt = "-I$patchRoot -MLaTeXML::Util::TestPatch"
  if ($env:PERL5OPT) {
    $env:PERL5OPT = "$patchOpt $env:PERL5OPT"
  } else {
    $env:PERL5OPT = $patchOpt
  }
  & cpanm LaTeXML@$Env:ChocolateyPackageVersion
} else {
  & cpanm --notest LaTeXML@$Env:ChocolateyPackageVersion
}

Get-Command latexml | Select-Object -ExpandProperty Definition
