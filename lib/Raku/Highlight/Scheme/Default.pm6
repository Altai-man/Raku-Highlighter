use Perl6::Parser;
use Raku::Highlight::Scheme;

class Raku::Highlight::Scheme::Default does Raku::Highlight::Scheme {
    method get-color($node --> Str) {
        given $node {
            when Perl6::Number {
                '0000FF'
            }
            when Perl6::Whatever {
                '4B0082'
            }
            when Perl6::PackageName {
                '4B0082'
            }
            when Perl6::PackageKeyword|Perl6::RoutineKeyword|
                    Perl6::StatementControl|Perl6::ScopeKeyword {
                '000080'
            }
            when Perl6::RegexAssertion {
                '800080'
            }
            when Perl6::RegexQuantifier {
                '8B0000'
            }
            when Perl6::Bareword {
                'FF4500'
            }
            when Perl6::WS|Perl6::Semicolon|Perl6::Newline|
                    Perl6::Balanced {
                Nil
            }
            when Perl6::Variable {
                '800080'
            }
            when Perl6::Pod|Perl6::Comment {
                '808080'
            }
            when Perl6::String::WordQuoting {
                '6A8759'
            }
            when Perl6::Operator {
                '8B0000'
            }
            when Perl6::String::Escaping|Perl6::Backslash {
                '008000'
            }
            when Perl6::String::Interpolation {
                '800080'
            }
            default {
                # We will encounter it lots soon
                die "NYI for $node.^name ($node.to-string())";
            }
        }
    }
}