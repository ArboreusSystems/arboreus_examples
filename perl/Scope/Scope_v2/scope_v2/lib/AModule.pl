#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature qw/state/;

print("Printed by AModule\n");

sub mMain1 {

	my $oTestVariable = 0;
	$oTestVariable += 1;
	print("Printed by mMain1: ".$oTestVariable."\n");
}

sub mMain2 {

	state $oTestVariable = 0;
	$oTestVariable += 1;
	print("Printed by mMain2: ".$oTestVariable."\n");
}

sub mMain3 {

	state %oTestMap = (
		a => 1,
		b => 2,
		c => 3
	);
	print($oTestMap{$_[0]}."\n");
}

mMain1();
mMain1();
mMain1();

mMain2();
mMain2();
mMain2();

mMain3('a');
mMain3('b');
mMain3('c');

1;