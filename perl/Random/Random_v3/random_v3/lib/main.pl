#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

use Math::Random::Secure qw/ rand /;

for (my $i = 0; $i < 10; $i++) {
	print(int(rand(10))."\n");
}

1;