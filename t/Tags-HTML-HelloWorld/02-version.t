use strict;
use warnings;

use Tags::HTML::HelloWorld;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Tags::HTML::HelloWorld::VERSION, 0.01, 'Version.');
