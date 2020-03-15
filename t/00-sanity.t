use Raku::Highlight;
use Test;

my $program = "say 42;";

say Raku::Highlight.highlight($program);

done-testing;
