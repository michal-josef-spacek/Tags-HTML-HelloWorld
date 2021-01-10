#!/usr/bin/env perl

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