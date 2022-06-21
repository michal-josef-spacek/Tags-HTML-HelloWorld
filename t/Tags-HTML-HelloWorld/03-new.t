use strict;
use warnings;

use Tags::HTML::HelloWorld;
use Tags::Output::Raw;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Tags::HTML::HelloWorld->new;
isa_ok($obj, 'Tags::HTML::HelloWorld');

# Test.
$obj = Tags::HTML::HelloWorld->new(
	'tags' => Tags::Output::Raw->new,
);
isa_ok($obj, 'Tags::HTML::HelloWorld');
