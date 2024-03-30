#!/usr/bin/perl

use strict;
use warnings;
use feature qw(say);

BEGIN {

	use Cwd qw();
	push(@INC,Cwd::cwd());
	push(@INC,Cwd::cwd()."/AModule1");
};

# use AModule1::Package1 qw(:default);
use AModule1::Package1 qw(:all);

say(AModule1::Package1::mSumm(10,20));
say(AModule1::Package1::mTestString);
