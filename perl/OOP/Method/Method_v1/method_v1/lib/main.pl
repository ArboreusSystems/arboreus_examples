#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use feature qw/say/;

BEGIN {

	use Cwd qw();
	push(@INC,Cwd::cwd())
};

use AModule1;
use AModule2;

say "AModule1.mSum(2,3) = ".mSum(2,3);
say "AModule2::mSum(2,3) = ".AModule2::mSum(2,3);

1;



