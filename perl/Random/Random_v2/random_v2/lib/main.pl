#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

use Crypt::Random qw/ makerandom makerandom_itv /;

my $oNumber1 = 10;
my $oRandom1 = makerandom(
	Size => $oNumber1,
	Strength => 1,
	Uniform => 1
);
my $oDice1 = int(6 * $oRandom1 / (2 ** $oNumber1));
print("Dice: ".$oDice1."\n");

my $oNumber2 = 10;
my $oRandom2 = makerandom_itv (
	Size => $oNumber2,
	Strength => 1,
	Uniform => 1,
	Lower => 1,
	Upper => 7
);
print("Random: ".$oRandom2."\n");