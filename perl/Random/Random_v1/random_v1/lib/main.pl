#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

my $oRandom = 0;

print "------------------------\n";
for (my $i = 0; $i < 10; $i++) {
	$oRandom = rand();
	print("rand(): ".$oRandom."\n");
}

print "------------------------\n";
for (my $i = 0; $i < 10; $i++) {
	$oRandom = rand(100);
	print("rand(100): ".$oRandom."\n");
}

print "------------------------\n";
for (my $i = 0; $i < 10; $i++) {
	$oRandom = int(rand(100));
	print("int(rand(100)): ".$oRandom."\n");
}

print "------------------------\n";
my $oLimitMin = 20;
my $oLimitMax = 45;
for (my $i = 0; $i < 10; $i++) {
	$oRandom = int(rand($oLimitMax - $oLimitMin)) + $oLimitMin;;
	print("int(rand(20..45)): ".$oRandom."\n");
}

1;
