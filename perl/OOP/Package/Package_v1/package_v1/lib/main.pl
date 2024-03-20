#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature qw/say/;

BEGIN {

	use Cwd qw();
	push(@INC,Cwd::cwd())
};

use Data::Dumper;
use APackage1;
use APackage2;

print "------------------------\n";
my $oPackage1 = APackage1::mInstance(1,2,3,4);
say("\$oPackage1->inParameter1: ".$oPackage1->{inParameter1});
say("\$oPackage1->inParameter2: ".$oPackage1->{inParameter2});
say("\$oPackage1->inParameter3: ".$oPackage1->{inParameter3});
say("\$oPackage1->inParameter4: ".$oPackage1->{inParameter4});

print "------------------------\n";
my $oPackage2 = APackage2->mInstance(1,2,3,4);
say("\$oPackage2->inParameter1: ".$oPackage2->{inParameter1});
say("\$oPackage2->inParameter2: ".$oPackage2->{inParameter2});
say("\$oPackage2->inParameter3: ".$oPackage2->{inParameter3});
say("\$oPackage2->inParameter4: ".$oPackage2->{inParameter4});

1;
