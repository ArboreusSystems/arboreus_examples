#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use feature qw/say/;

print "------------------------\n";
say("\@ARGV Count: ".@ARGV);
say("\@ARGV: \n".Dumper(@ARGV));

print "------------------------\n";
say("\@INC Count: ".@INC);
say("\@INC: \n".Dumper(@INC));

print "------------------------\n";
say("\%ENV Count: ".%ENV);
say("\%ENV: \n".Dumper(%ENV));

print "------------------------\n";
say("__PACKAGE__:".__PACKAGE__);
say("__FILE__:".__FILE__);
say("__LINE__:".__LINE__);