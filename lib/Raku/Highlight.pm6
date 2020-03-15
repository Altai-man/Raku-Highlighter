use Perl6::Parser;
use Raku::Highlight::Renderer;
use Raku::Highlight::Scheme::Default;
use Raku::Highlight::Node;

class Raku::Highlight {
    method highlight(Str $source, Raku::Highlight::Renderer :$renderer = Raku::Highlight::Renderer::HTML,
                     Raku::Highlight::Scheme :$schema = Raku::Highlight::Scheme::Default) {
        my @token = Perl6::Parser.new.to-tokens-only($source);
        my $result;
        for @token -> $token {
            my $node = Raku::Highlight::Node.new:
                    content => $token.to-string,
                    color => $schema.get-color($token);
            $result ~= $renderer.render($node);
        }
        $result;
    }
}
