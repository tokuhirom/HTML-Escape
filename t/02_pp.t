use strict;
use warnings;
use utf8;
use Test::More;
BEGIN {
    $ENV{HTML_ESCAPE_PUREPERL} = 1;
}
use HTML::Escape;

is(html_escape("<^o^>"), '&lt;^o^&gt;');
is(html_escape("'"), "&#39;");
is(html_escape("\0>"), "\0&gt;");

done_testing;

