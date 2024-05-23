use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Tags::HTML::HelloWorld;
use Tags::Output::Structure;
use Test::MockObject;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $tags = Tags::Output::Structure->new;
my $obj = Tags::HTML::HelloWorld->new(
	'tags' => $tags,
);
my $ret = $obj->init('Hello');
is($ret, undef, 'Right init (Hello).');

# Test.
$tags = Tags::Output::Structure->new;
$obj = Tags::HTML::HelloWorld->new(
	'tags' => $tags,
);
eval {
	$obj->init;
};
is($EVAL_ERROR, "Bad input text.\n",
	"Bad input text (undef).");
clean();

# Test.
$tags = Tags::Output::Structure->new;
$obj = Tags::HTML::HelloWorld->new(
	'tags' => $tags,
);
my $mock = Test::MockObject->new;
eval {
	$obj->init($mock);
};
is($EVAL_ERROR, "Bad input text.\n",
	"Bad input text (object).");
clean();
