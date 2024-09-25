#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

use Data::Dumper;
use feature qw/say/;

use JSON::Parse 'read_json';
use Cwd;

my $oPath = Cwd::cwd()."/lib/test.json";
say(Dumper($oPath));

my $oJSON = read_json($oPath);
say(Dumper($oJSON));

1;