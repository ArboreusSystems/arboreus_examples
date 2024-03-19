#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use feature qw/say/;

my @oList = qw/ milk bread beef eggs/;

print "------------------------\n";
foreach my $iItem (@oList) {
	my @iCaptures = $iItem =~ m/(\w)(\w)/;
	say Dumper(\@iCaptures);
}

print "------------------------\n";
foreach my $iItem (@oList) {
	$iItem =~ m/^(\w{2})/;
	say("Matched item: ".$iItem." \$1: ".$1);
}

print "------------------------\n";
foreach my $iItem (@oList) {
	$iItem =~ s/\w{3}/REPLACED/;
	say("Replaced item: ".$iItem);
}


my $oString = "string123456   ";

print "------------------------\n";
if ($oString =~ m{string(\d+)(\s)}i) {
	say("Matched \$1: ".$1." \$2: ".$2);
} else {
	say("Not Matched");
}