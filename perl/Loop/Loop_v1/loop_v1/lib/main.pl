#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use feature qw/say/;

print("----------------------\n");
my $oWhileNumber = 0;
while ($oWhileNumber < 10) {
	say("While: ".$oWhileNumber);
	++$oWhileNumber;
}

print("----------------------\n");
my @oList1 = (1..10);
foreach my $iItem (@oList1) {
	$iItem += 1;
	say("Item: ".$iItem);
}

print("----------------------\n");
my @oList2 = (1..10);
my @oList3 = (1..3);
foreach my $iItem (@oList2) {
	say("Item: ".$iItem);
	foreach my $iNestedItem (@oList3) {
		say("\tNestedItem: ".$iNestedItem);
	}
}

print("----------------------\n");
foreach my $iItem (@oList2) {
	say("Item: ".$iItem);
	next if $iItem == 3;
	foreach my $iNestedItem (@oList3) {
		say("\tNestedItem: ".$iNestedItem);
	}
}

print("----------------------\n");
foreach my $iItem (@oList2) {
	say("Item: ".$iItem);
	$iItem++;
	redo if $iItem == 3;
	foreach my $iNestedItem (@oList3) {
		say("\tNestedItem: ".$iNestedItem);
	}
}

print("----------------------\n");
LOOP1:
foreach my $iItem (@oList2) {
	goto LOOP2 if $iItem == 4;
	say("Item: ".$iItem);
	LOOP2:
	foreach my $iNestedItem (@oList3) {
		say("\tNestedItem: ".$iNestedItem);
	}
}

1;
