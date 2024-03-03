#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

use Data::Dumper;

print ("-----------------------------------\n");
my @array1 = (1,"test_string",1.22);
print Dumper(@array1);
print ("\n");

print ("-----------------------------------\n");
my @array2 = qw/one two three another four/;
print Dumper(@array2);
print ("\n");

print ("-----------------------------------\n");
my @array3 = qw/one two three four/;
print Dumper(@array3);
print ("\n");

print ("-----------------------------------\n");
my @array4 = qw/one two three four/;
print Dumper($array4[0]);
print Dumper($array4[1]);
print Dumper($array4[2]);
print Dumper($array4[3]);
print Dumper($array4[-1]);
print Dumper($array4[-2]);
print Dumper($array4[-3]);
print Dumper($array4[-4]);
print Dumper($array4[$#array4 - ($#array4 - 0)]);
print Dumper($array4[$#array4 - ($#array4 - 1)]);
print Dumper($array4[$#array4 - ($#array4 - 2)]);
print Dumper($array4[$#array4 - ($#array4 - 3)]);
print ("\n");

print ("-----------------------------------\n");
my @array5 = qw/one two three four/;
$array5[10 - 1] = "ten";
print Dumper(@array5);
print ("\n");

print ("-----------------------------------\n");
my @array6 = (0,1,2,3,4);
print Dumper(@array6);
print ("\n");
push(@array6,5);
print Dumper(@array6);
print ("\n");
pop(@array6);
print Dumper(@array6);
print ("\n");
shift(@array6);
print Dumper(@array6);
print ("\n");
unshift(@array6,0);
print Dumper(@array6);
print ("\n");

print ("-----------------------------------\n");
my @array7 = qw/a g y e r t m v d h p/;
@array7 = sort(@array7);
print Dumper(@array7);
print ("\n");

print ("-----------------------------------\n");
my @array8 = (1,33,43,56,4756,8,23,456);
@array8 = sort(@array8);
print Dumper(@array7);
@array8 = sort {$a <=> $b} @array8;
print Dumper(@array7);

1;
