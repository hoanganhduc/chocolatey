package LaTeXML::Util::TestPatch;
use strict;
use warnings;

use Test::More ();
require LaTeXML::Util::Test;

sub _normalize_line {
  my ($line) = @_;
  return $line unless defined $line;
  return $line unless $^O eq 'MSWin32';

  # Normalize path separators in candidates attributes.
  $line =~ s/candidates="([^"]*)"/'candidates="'.($1 =~ s#\\#/#gr).'"'/e;

  # Ignore font attributes on accent tokens (Windows font metadata differs).
  $line =~ s/(<XMTok\b[^>]*\brole="(?:OVERACCENT|UNDERACCENT)"[^>]*)\sfont="[^"]*"/$1/g;

  return $line;
}

no warnings 'redefine';
*LaTeXML::Util::Test::is_strings = sub {
  my ($strings1, $strings2, $name) = @_;
  my $max = $#$strings1 > $#$strings2 ? $#$strings1 : $#$strings2;
  my $ok  = 1;
  for (my $i = 0 ; $i <= $max ; $i++) {
    my $string1 = $$strings1[$i];
    my $string2 = $$strings2[$i];
    if (defined $string1) {
      chomp($string1);
    } else {
      $ok = 0; $string1 = "";
    }
    if (defined $string2) {
      chomp($string2);
    } else {
      $ok = 0; $string2 = "";
    }

    $string1 = _normalize_line($string1);
    $string2 = _normalize_line($string2);

    if (!$ok || ($string1 ne $string2)) {
      return LaTeXML::Util::Test::do_fail($name,
        "Difference at line " . ($i + 1) . " for $name\n"
          . "      got : '$string1'\n"
          . " expected : '$string2'\n");
    }
  }
  return Test::More::ok(1, $name);
};

1;
