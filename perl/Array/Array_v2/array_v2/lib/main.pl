#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use List::Util qw/shuffle/;

my @oArray = ('milk', 'bread', 'beef', 'eggs');
print "Array itself \@oArray: ", @oArray, "\n";
print "Highest index of array \$#oArray: ", $#oArray, "\n";
print "First element of array \$oArray[0]: ", $oArray[0], "\n";
print "Array elements: ", $oArray[0], " ", $oArray[1]," ", $oArray[2]," ", $oArray[3], "\n";

my @oArrayReversed = reverse @oArray;
my $oSizeArrayReversed = scalar(@oArrayReversed);
print "Reversed array: ";
for (my $i = 0; $i < $oSizeArrayReversed; $i++) {
	print $oArrayReversed[$i];
	if ($i == $oSizeArrayReversed - 1) {
		print "\n";
	} else {
		print " "
	}
}

my @oArrayOfNumbers = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
my $oSizeArrayOfNumbers = scalar(@oArrayOfNumbers);
print "Array of numbers: ";
for (my $i = 0; $i < $oSizeArrayOfNumbers; $i++) {
	print $oArrayOfNumbers[$i];
	if ($i == $oSizeArrayOfNumbers - 1) {
		print "\n";
	} else {
		print " "
	}
}

my @oArrayOfShuffledNumbers = shuffle(@oArrayOfNumbers);
print "Shuffled array of numbers: ";
for (my $i = 0; $i < $oSizeArrayOfNumbers; $i++) {
	print $oArrayOfShuffledNumbers[$i];
	if ($i == $oSizeArrayOfNumbers - 1) {
		print "\n";
	} else {
		print " "
	}
}

1;
