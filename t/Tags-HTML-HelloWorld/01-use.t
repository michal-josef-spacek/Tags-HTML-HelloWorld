use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Tags::HTML::HelloWorld');
}

# Test.
require_ok('Tags::HTML::HelloWorld');
