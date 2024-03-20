#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature qw/say/;

# use Data::Dumper;
# require Data::Dumper;
# use Data::Dumper qw/Dumper/;
# require("Data/Dumper.pm");

BEGIN {

	use Cwd qw//;
	push(@INC,Cwd::cwd());

	require("Data/Dumper.pm");
	Data::Dumper->import();
}

say(Data::Dumper::Dumper("test"));

require APackage::Class1;

my $oClass1 = APackage::Class1->mInstance();
$oClass1->pProperty1("test_property_1");
say("\$oClass1->pProperty1 = ".$oClass1->pProperty1);

1;