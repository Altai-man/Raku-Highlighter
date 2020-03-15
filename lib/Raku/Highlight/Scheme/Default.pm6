use Perl6::Parser;
use Raku::Highlight::Scheme;

class Raku::Highlight::Scheme::Default does Raku::Highlight::Scheme {
    method get-color($node --> Str) {
        given $node {
            when Perl6::Number {
                '0000FF'
            }
            when Perl6::Bareword {
                'FF4500'
            }
            when Perl6::WS|Perl6::Semicolon {
                Nil
            }
            default {
                # We will encounter it lots soon
                die "NYI for $node.^name";
            }
        }
    }
}