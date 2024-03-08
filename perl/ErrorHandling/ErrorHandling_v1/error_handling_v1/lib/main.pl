#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use Math::Round;

sub mRandomNumber {

	my $oNumber = int(rand(100));
	if ($oNumber == 2 * round($oNumber/2)) {
		1;
	} else {
		0;
	}
}

if (mRandomNumber()) {
	print("All is Ok");
} else {
	die("Wrong number");
}

1;
