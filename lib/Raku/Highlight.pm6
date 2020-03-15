use Perl6::Parser;
use Raku::Highlight::Renderer;
use Raku::Highlight::Scheme::Default;
use Raku::Highlight::Node;

class Raku::Highlight::Internals {
    has Perl6::Parser $.parser = Perl6::Parser.new;

    method highlight(Str $source, Raku::Highlight::Renderer :$renderer = Raku::Highlight::Renderer::HTML,
                     :$schema = Raku::Highlight::Scheme::Default) {
        my @token = $!parser.to-tokens-only($source);
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

class Raku::Highlight {
    method highlight(Str $source) {
        my $internals = Raku::Highlight::Internals.new;
        $internals.highlight($source);
    }
}