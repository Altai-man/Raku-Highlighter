use Raku::Highlight::Node;

role Raku::Highlight::Renderer {
    method render(Raku::Highlight::Node $node) {...}
}

class Raku::Highlight::Renderer::HTML does Raku::Highlight::Renderer {
    method render(Raku::Highlight::Node $node) {
        with $node.color {
            "<span style=\"color:$_\">$node\</span\>"
        } else {
            $node;
        }
    }
}