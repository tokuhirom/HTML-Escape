use strict;
use warnings;
use utf8;
use Test::More;
use HTML::Escape;

is(escape_html("<^o^>"), '&lt;^o^&gt;');
is(escape_html("'"), "&#39;");
is(escape_html("\0>"), "\0&gt;");

done_testing;

