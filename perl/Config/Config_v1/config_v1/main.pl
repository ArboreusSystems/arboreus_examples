#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use Data::Dumper;
use Config::File;
use Config::Tiny;

BEGIN {

	use Cwd qw();
	push(@INC,Cwd::cwd());
};

my $oConfig1 = Config::File::read_config_file(Cwd::cwd()."/test1.conf");
say(Dumper($oConfig1));

my $oExists_VALUE_ONE = exists $oConfig1->{"VALUE_ONE"} ? "yes" : "no";
say("VALUE_ONE existence: ".$oExists_VALUE_ONE);

my $oExists_VALUE_TWO = exists $oConfig1->{"VALUE_TWO"} ? "yes" : "no";
say("VALUE_TWO existence: ".$oExists_VALUE_TWO);

my $oExists_VALUE_THREE = exists $oConfig1->{"VALUE_THREE"} ? "yes" : "no";
say("VALUE_THREE existence: ".$oExists_VALUE_THREE);

my $oExists_VALUE_FOUR = exists $oConfig1->{"VALUE_FOUR"} ? "yes" : "no";
say("VALUE_FOUR existence: ".$oExists_VALUE_FOUR);

my $oConfig2 = Config::Tiny->read(Cwd::cwd()."/test2.conf");
say(Dumper($oConfig2));


1;