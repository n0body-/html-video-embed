use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    'width' => 450,
    'height' => 370,
});

is( $embeder->url_to_embed('http://www.liveleak.com/view?i=ffc_1272800490'),

    '<object width="450" height="370"><param name="movie" value="http://www.liveleak.com/e/ffc_1272800490" />'
        .'<param name="wmode" value="transparent" />'
        .'<embed src="http://www.liveleak.com/e/ffc_1272800490" type="application/x-shockwave-flash" '
        .'wmode="transparent" width="450" height="370"></embed></object>',

    'liveleak embed works'
);

is( $embeder->url_to_embed('http://www.liveleak.com/view?i=ffc_12728770049090'), undef, 'invalid i=');
is( $embeder->url_to_embed('http://www.liveleak.com/view?v=ffc_12728004900'), undef, 'no i=');
is( $embeder->url_to_embed('http://www.l1veleak.com/view?i=ffc_12728004900'), undef, 'l1veleak, not liveleak');

done_testing;
