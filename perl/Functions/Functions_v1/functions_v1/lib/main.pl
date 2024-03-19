#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use feature qw/say/;

print "------------------------\n";

my @oList = qw/milk bread eggs chicken/;
my @oMap1 = map {
	my $mItem = uc $_;
	$mItem .= "_map_item";
} @oList;

say Dumper(\@oList);
say Dumper(\@oMap1);

print "------------------------\n";

my @oMap2 = map {
	$_ eq "bread" || $_ eq "milk"
} @oList;

say Dumper(\@oList);
say Dumper(\@oMap2);

print "------------------------\n";

my @oNames = ('jacob','alexander','ethan','andrew');
my @oCorrectedNames = map(ucfirst, @oNames);

say Dumper(\@oNames);
say Dumper(\@oCorrectedNames);

print "------------------------\n";

my @oDouble = map { $_ * 2 } (1,2,3,4,5);
say Dumper(\@oDouble);

print "------------------------\n";

my @oParts1 = split(m/e/,"test_test_test");
say Dumper(\@oParts1);
my @oParts2 = split(m//,"test_test_test");
say Dumper(\@oParts2);

print "------------------------\n";

my @oLetters = qw/a s d f g h j k l/;
my $oJoined1 = join("_",@oLetters);
say($oJoined1);
my $oJoined2 = join("",@oLetters);
say($oJoined2);

print "------------------------\n";

my $oWordLC = "cat";
say("Word uc: ".uc($oWordLC));
my $oWordUC = "CAT";
say("Word lc: ".lc($oWordUC));

print "------------------------\n";

my $oStringLength = "kjhgjkguiyg3rknvmsdbnc";
say("Length of \"".$oStringLength."\" is ".length($oStringLength));

print "------------------------\n";

say("int(4.1): ".int(4.1));
say("int(4.5): ".int(4.5));
say("int(4.9): ".int(4.9));
