#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;

print ("-----------------------------------\n");
my @oArray = qw/ string1 string2 string3 /;
print(Dumper(\@oArray));

print ("-----------------------------------\n");
my $rArray1 = \@oArray;
push($rArray1->@*,"new_string1-1");
push($rArray1->@*,"new_string1-2");
print(Dumper(\@oArray));

print ("-----------------------------------\n");
my $rArray2 = \@oArray;
push($rArray2->@*,"new_string2-1");
push($rArray2->@*,"new_string2-2");
print(Dumper(\@oArray));

print ("-----------------------------------\n");
my $rArray3 = [1,2,3,4];
print(Dumper($rArray3));
print(Dumper($rArray3->[0]));
print(Dumper($rArray3->[1]));
print(Dumper($rArray3->[2]));
print(Dumper($rArray3->[3]));

print ("-----------------------------------\n");
print(Dumper(@$rArray3));
print(Dumper($rArray3->@*));

print ("-----------------------------------\n");
my $rHash = {
    a     => "one",
    b     => "two",
    1     => "three",
    "key" => "four"
};
print(Dumper($rHash));
print(Dumper($rHash->{a}));
print(Dumper($rHash->{b}));
print(Dumper($rHash->{1}));
print(Dumper($rHash->{"key"}));

print ("-----------------------------------\n");
print(Dumper(%$rHash));
print(Dumper($rHash->%*));

print ("-----------------------------------\n");
my $rHashStructure = {
    key1 => 1,
    key2 => 2,
    key3 => {
        key3_1 => 1,
        key3_2 => 2
    },
    key4 => [
        1,
        2,
        3,{
            key4_3_1 => 1,
            key4_3_2 => 2,
            key4_3_3 => qw/ one two three/,
            key4_3_4 => [qw/ one two three/]
        }
    ]
};
print(Dumper(\$rHashStructure));
print(Dumper($rHashStructure->{key4}->[3]->{key4_3_3}));
print(Dumper($rHashStructure->{key4}->[3]->{key4_3_4}));

1;
