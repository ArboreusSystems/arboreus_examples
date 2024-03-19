#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use feature qw/say/;

my $oTest = "TestString";

if ($oTest =~ "SomeString") {
	say("0: Matched");
} else {
	say("0: Not Matched");
}

if ($oTest =~ "TestString") {
	say("1: Matched");
} else {
	say("1: Not Matched");
}

if ($oTest =~ m{Test}) {
	say("2: Matched");
} else {
	say("2: Not Matched");
}

if ($oTest =~ m{test}) {
	say("3: Matched");
} else {
	say("3: Not Matched");
}

if ($oTest =~ /String/) {
	say("4: Matched");
} else {
	say("4: Not Matched");
}

if ($oTest =~ m{Test$}) {
	say("5: Matched");
} else {
	say("5: Not Matched");
}

if ($oTest =~ m{^Test}) {
	say("6: Matched");
} else {
	say("6: Not Matched");
}

if ($oTest =~ m{^String}) {
	say("7: Matched");
} else {
	say("7: Not Matched");
}

if ($oTest !~ m{^String}) {
	say("8: Matched");
} else {
	say("8: Not Matched");
}

1;
