use strict;
use warnings;

use CSS::Struct::Output::Structure;
use English;
use Error::Pure::Utils qw(clean);
use Tags::HTML::HelloWorld;
use Tags::Output::Structure;
use Test::MockObject;
use Test::More 'tests' => 7;
use Test::NoWarnings;

# Test.
my $obj = Tags::HTML::HelloWorld->new;
isa_ok($obj, 'Tags::HTML::HelloWorld');

# Test.
$obj = Tags::HTML::HelloWorld->new(
	'css' => CSS::Struct::Output::Structure->new,
	'tags' => Tags::Output::Structure->new,
);
isa_ok($obj, 'Tags::HTML::HelloWorld');

# Test.
eval {
	Tags::HTML::HelloWorld->new(
		'css' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'css' must be a 'CSS::Struct::Output::*' class.\n",
	"Parameter 'css' must be a 'CSS::Struct::Output::*' class (string).");
clean();

# Test.
my $mock = Test::MockObject->new;
eval {
	Tags::HTML::HelloWorld->new(
		'css' => $mock,
	);
};
is($EVAL_ERROR, "Parameter 'css' must be a 'CSS::Struct::Output::*' class.\n",
	"Parameter 'css' must be a 'CSS::Struct::Output::*' class (other object).");
clean();

# Test.
eval {
	Tags::HTML::HelloWorld->new(
		'tags' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'tags' must be a 'Tags::Output::*' class.\n",
	"Parameter 'tags' must be a 'Tags::Output::*' class (string).");
clean();

# Test.
$mock = Test::MockObject->new;
eval {
	Tags::HTML::HelloWorld->new(
		'tags' => $mock,
	);
};
is($EVAL_ERROR, "Parameter 'tags' must be a 'Tags::Output::*' class.\n",
	"Parameter 'tags' must be a 'Tags::Output::*' class (other object).");
clean();
