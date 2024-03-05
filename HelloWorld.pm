package Tags::HTML::HelloWorld;

use base qw(Tags::HTML);
use strict;
use warnings;

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	my $self = $class->SUPER::new(@params);

	$self->_cleanup;

	# Object.
	return $self;
}

sub _cleanup {
	my $self = shift;

	$self->{'_text'} = 'Hello world!';

	return;
}

sub _init {
	my ($self, $text) = @_;

	$self->{'_text'} = $text;

	return;
}

# Process 'Tags'.
sub _process {
	my $self = shift;

	$self->{'tags'}->put(
		['b', 'div'],
		['a', 'class', 'hello-world'],
		['d', $self->{'_text'}],
		['e', 'div'],
	);

	return;
}

sub _process_css {
	my $self = shift;

	$self->{'css'}->put(
		['s', '.hello-world'],
		['d', 'margin', 'auto'],
		['d', 'padding', '1em'],
		['d', 'backround-color', 'yellow'],
		['e'],
	);

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Tags::HTML::HelloWorld - Tags helper for hello world app.

=head1 SYNOPSIS

 use Tags::HTML::HelloWorld;

 my $obj = Tags::HTML::HelloWorld->new(%params);
 $obj->cleanup;
 $obj->prepare;
 $obj->init($text);
 $obj->process;
 $obj->process_css;

=head1 METHODS

=head2 C<new>

 my $obj = Tags::HTML::HelloWorld->new(%params);

Constructor.

=over 8

=item * C<css>

'L<CSS::Struct::Output>' object for L<process_css> processing.

Default value is undef.

=item * C<no_css>

No CSS support flag.
If this flag is set to 1, L<process_css()> returns undef.

Default value is 0.

=item * C<tags>

'L<Tags::Output>' object.

Default value is undef.

=back

=head2 C<cleanup>

 $obj->cleanup;

Cleanup module to init state, which set text to 'Hello World!'.

Returns undef.

=head2 C<init>

 $obj->init($text);

Set text to print.

Returns undef.

=head2 C<prepare>

 $obj->prepare;

Process initialization before page run.

Do nothing in this module.

Returns undef.

=head2 C<process>

 $obj->process;

Process L<Tags> structure for output with message.

Returns undef.

=head2 C<process_css>

 $obj->process_css;

Process L<CSS::Struct> structure for output.

Returns undef.

=head1 ERRORS

 new():
         From Class::Utils::set_params():
                 Unknown parameter '%s'.
         From Tags::HTML::new():
                 Parameter 'tags' must be a 'Tags::Output::*' class.

 process():
         From Tags::HTML::process():
                 Parameter 'tags' isn't defined.

=head1 EXAMPLE1

 use strict;
 use warnings;

 use CSS::Struct::Output::Raw;
 use Tags::HTML::HelloWorld;
 use Tags::HTML::Page::Begin;
 use Tags::HTML::Page::End;
 use Tags::Output::Raw;
 use Unicode::UTF8 qw(decode_utf8 encode_utf8);

 my $css = CSS::Struct::Output::Raw->new;
 my $tags = Tags::Output::Raw->new(
         'xml' => 1,
 );

 my $begin = Tags::HTML::Page::Begin->new(
         'author' => decode_utf8('Michal Josef Špaček'),
         'css' => $css,
         'generator' => 'Tags::HTML::Page::Begin',
         'lang' => {
                 'title' => 'Hello world!',
         },
         'tags' => $tags,
 );
 my $end = Tags::HTML::Page::End->new(
         'tags' => $tags,
 );
 my $obj = Tags::HTML::HelloWorld->new(
         'css' => $css,
         'tags' => $tags,
 );

 # Process CSS.
 $obj->process_css;

 # Process HTML.
 $begin->process;
 $obj->process;
 $end->process;

 # Print out.
 print encode_utf8($tags->flush);

 # Output:
 # <!DOCTYPE html>
 # <html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><meta name="author" content="Michal Josef Špaček" /><meta name="generator" content="Tags::HTML::Page::Begin" /><meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Hello world!</title><style type="text/css">.hello-world{margin:auto;padding:1em;backround-color:yellow;}
 # </style></head><body><div class="hello-world">Hello world!</div></body></html>

=head1 EXAMPLE2

 use strict;
 use warnings;

 use CSS::Struct::Output::Indent;
 use Tags::HTML::HelloWorld;
 use Tags::HTML::Page::Begin;
 use Tags::HTML::Page::End;
 use Tags::Output::Indent;
 use Unicode::UTF8 qw(decode_utf8 encode_utf8);

 my $css = CSS::Struct::Output::Indent->new;
 my $tags = Tags::Output::Indent->new(
         'preserved' => ['style'],
         'xml' => 1,
 );

 my $begin = Tags::HTML::Page::Begin->new(
         'author' => decode_utf8('Michal Josef Špaček'),
         'css' => $css,
         'generator' => 'Tags::HTML::Page::Begin',
         'lang' => {
                 'title' => 'Hello world!',
         },
         'tags' => $tags,
 );
 my $end = Tags::HTML::Page::End->new(
         'tags' => $tags,
 );

 my $obj = Tags::HTML::HelloWorld->new(
         'css' => $css,
         'tags' => $tags,
 );

 # Process CSS.
 $obj->process_css;

 # Process HTML.
 $begin->process;
 $obj->process;
 $end->process;

 # Print out.
 print encode_utf8($tags->flush);

 # Output:
 # <!DOCTYPE html>
 # <html lang="en">
 #   <head>
 #     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 #     <meta name="author" content="Michal Josef Špaček" />
 #     <meta name="generator" content="Tags::HTML::Page::Begin" />
 #     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
 #     <title>
 #       Hello world!
 #     </title>
 #     <style type="text/css">
 # .hello-world {
 #         margin: auto;
 #         padding: 1em;
 #         backround-color: yellow;
 # }
 # </style>
 #   </head>
 #   <body>
 #     <div class="hello-world">
 #       Hello world!
 #     </div>
 #   </body>
 # </html>

=head1 DEPENDENCIES

None.

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Tags-HTML-HelloWorld>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2021-2023 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
