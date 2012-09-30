use strict;
use warnings;
use utf8;
use Test::More;
use HTML::Escape;

is(html_escape("<^o^>"), '&lt;^o^&gt;');
is(html_escape("'"), "&#39;");
is(html_escape("\0>"), "\0&gt;");

done_testing;

