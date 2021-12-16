package Tags::HTML::HelloWorld;

use base qw(Tags::HTML);
use strict;
use warnings;

use Tags::HTML::Page::Begin;
use Tags::HTML::Page::End;
use Unicode::UTF8 qw(decode_utf8);

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# No CSS support.
	push @params, 'no_css', 1;

	my $self = $class->SUPER::new(@params);

	# Object.
	return $self;
}

# Process 'Tags'.
sub _process {
	my $self = shift;

	my $begin = Tags::HTML::Page::Begin->new(
		'author' => decode_utf8('Michal Josef Špaček'),
		'lang' => {
			'title' => 'Hello world!',
		},
		'tags' => $self->{'tags'},
	);

	my $end = Tags::HTML::Page::End->new(
		'tags' => $self->{'tags'},
	);

	$begin->process;
	$self->{'tags'}->put(
		['b', 'div'],
		['d', 'Hello world!'],
		['e', 'div'],
	);
	$end->process;

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
 $obj->process;

=head1 METHODS

=head2 C<new>

 my $obj = Tags::HTML::HelloWorld->new(%params);

Constructor.

=over 8

=item * C<tags>

'Tags::Output' object.

Default value is undef.

=back

=head2 C<process>

 $obj->process;

Process Tags structure for output with hello world message.

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

 use Tags::HTML::HelloWorld;
 use Tags::Output::Raw;

 # Object.
 my $tags = Tags::Output::Raw->new;
 my $obj = Tags::HTML::HelloWorld->new(
         'tags' => $tags,
 );

 # Process page.
 $obj->process;

 # Print out.
 print $tags->flush;

 # Output:
 # <!DOCTYPE html>
 # <html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta><meta name="author" content="Michal Josef Špaček"></meta><meta name="generator" content="Perl module: Tags::HTML::Page::Begin, Version: 0.11"></meta><title>Hello world!</title></head><body><div>Hello world!</div></body></html>

=head1 EXAMPLE2

 use strict;
 use warnings;

 use Tags::HTML::HelloWorld;
 use Tags::Output::Indent;

 # Object.
 my $tags = Tags::Output::Indent->new;
 my $obj = Tags::HTML::HelloWorld->new(
         'tags' => $tags,
 );

 # Process page.
 $obj->process;

 # Print out.
 print $tags->flush;

 # Output:
 # <!DOCTYPE html>
 # <html lang="en">
 #   <head>
 #     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 #     </meta>
 #     <meta name="author" content="Michal Josef Špaček">
 #     </meta>
 #     <meta name="generator" content=
 #       "Perl module: Tags::HTML::Page::Begin, Version: 0.11">
 #     </meta>
 #     <title>
 #       Hello world!
 #     </title>
 #   </head>
 #   <body>
 #     <div>
 #       Hello world!
 #     </div>
 #   </body>
 # </html>

=head1 DEPENDENCIES

L<Tags::HTML::Page::Begin>,
L<Tags::HTML::Page::End>,
L<Unicode::UTF8>.

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Tags-HTML-HelloWorld>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© Michal Josef Špaček 2021

BSD 2-Clause License

=head1 VERSION

0.01

=cut
