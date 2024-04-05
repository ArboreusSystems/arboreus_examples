#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use Data::Dumper;
use YAML::XS 'LoadFile';

BEGIN {

	use Cwd qw();
	push(@INC,Cwd::cwd());
};

my $oConfigFile = Cwd::cwd()."/test.conf";
my $oConfig = YAML::XS::LoadFile($oConfigFile);
say(Dumper($oConfig));

1;
