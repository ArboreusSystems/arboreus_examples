#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Math::Round;

eval {

	my $oNumber = int(rand(100));
	if ($oNumber == 2 * round($oNumber/2)) {
		print("All is Ok");
	} else {
		die("Wrong number");
	}
}