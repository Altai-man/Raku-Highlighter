class Raku::Highlight::Node {
    has Str $.content;
    has Str $.color;

    method Str { $!content }
}
