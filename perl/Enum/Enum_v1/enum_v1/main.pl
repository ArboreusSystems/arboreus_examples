#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
no warnings 'experimental';
use feature qw/say switch/;
use Data::Dumper;

use enum qw/ENUM: FALSE TRUE/;
my $oEnum1 = FALSE;
say(Dumper($oEnum1));
if ($oEnum1 == TRUE) {
	say("TRUE");
} else {
	say("FALSE");
}

use constant {
	PHONE_HOME   => 0,
	PHONE_WORK   => 1,
	PHONE_MOBILE => 2000,
};
my $oEnum2 = PHONE_MOBILE;
say(Dumper($oEnum2));
given ($oEnum2) {
	when (PHONE_HOME) {say("Home")}
	when (PHONE_WORK) {say("Work")}
	when (PHONE_MOBILE) {say("Mobile")}
	default {say("Error")}
}
