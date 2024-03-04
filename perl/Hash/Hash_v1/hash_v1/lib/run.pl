#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;

my $iKey;
my $iValue;

print ("-----------------------------------\n");
my %oMap = (
    a => 1,
    b => 2,
    c => 3,
    d => "string"
);
print Dumper(%oMap);

print ("-----------------------------------\n");
foreach $iKey (keys %oMap) {
    print "key: ".$iKey." value: ".$oMap{$iKey}."\n";
}

print ("-----------------------------------\n");
my %oPrices;
$oPrices{"water"} = 11.00;
$oPrices{"milk"} = 1.25;
$oPrices{"pork"} = 3.00;
$oPrices{"beef"} = 12.54;
# $oPrices{"something"} = undef;

while (($iKey, $iValue) = each (%oPrices)) {
    print "$iKey costs $oPrices{$iKey}\n";
}

print ("-----------------------------------\n");
print Dumper(%oPrices{"water","beef"});

print ("-----------------------------------\n");
print Dumper(keys(%oPrices));

print ("-----------------------------------\n");
my $oExistsBread = exists $oPrices{"bread"} ? "yes" : "no";
print "Key \"bread\" existed: ".$oExistsBread."\n";
my $oExistsMilk = exists $oPrices{"milk"} ? "yes" : "no";
print "Key \"milk\" existed: ".$oExistsMilk."\n";
my $oExistsSomething = exists $oPrices{"something"} ? "yes" : "no";
print "Key \"something\" existed: ".$oExistsSomething."\n";

print ("-----------------------------------\n");
delete($oPrices{"something"});
print Dumper(keys(%oPrices));

1;