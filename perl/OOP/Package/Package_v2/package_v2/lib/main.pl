#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use Data::Dumper;

BEGIN {

	use Cwd qw//;
	push(@INC,Cwd::cwd());
};

use APackage::Class1;

my $oClass1 = APackage::Class1->mInstance();
$oClass1->pProperty1("test_property_1");
say("\$oClass1->pProperty1 = ".$oClass1->pProperty1);

my $oClass2 = APackage::Class1->mInstance();
$oClass2->pProperty1("test_property_2");
say("\$oClass2->pProperty1 = ".$oClass2->pProperty1);

1;

