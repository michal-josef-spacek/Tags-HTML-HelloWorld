#!/usr/bin/env perl

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