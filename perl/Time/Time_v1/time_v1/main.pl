#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use Data::Dumper;

use Time::HiRes qw(time gettimeofday);
use POSIX qw(strftime);
use Time::Moment;
use Time::Format qw/%time/;

say("--------------------------------");
say("Time 1");

my $oTime1 = time();
say(Dumper($oTime1));
my $oDate1 = POSIX::strftime("%Y%m%d %H:%M:%S", POSIX::localtime($oTime1));
say($oDate1);
$oDate1 .= POSIX::sprintf(".%03d",($oTime1 - int($oTime1)) * 1000);
say($oDate1);

say("--------------------------------");
say("Time 2");

say(Time::Moment->now->strftime("%Y%m%d %T%3f"));

say("--------------------------------");
say("Time 3");

my $oTime3 = Time::HiRes::gettimeofday();
say(Dumper($oTime3));
print qq|$time{'yyyymmdd hh:mm:ss.mmm', $oTime3}\n|;

1;