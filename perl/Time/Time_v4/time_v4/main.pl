#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use Data::Dumper;

use DateTime::HiRes;

my $oDateTimeHiRes = DateTime::HiRes->now();
say("DateTime::HiRes->now()->epoch() = ".$oDateTimeHiRes->epoch());
say("DateTime::HiRes->now()->strftime('%s%N') = ".$oDateTimeHiRes->strftime('%s%N'));

use Time::HiRes;

my $oTimeOfDay = Time::HiRes::gettimeofday();
say("Time::HiRes::gettimeofday() = ".$oTimeOfDay);

my ($oSeconds,$oMicroseconds) = Time::HiRes::gettimeofday();
say("seconds Time::HiRes::gettimeofday() = ".$oSeconds.".".$oMicroseconds);
say("milliseconds Time::HiRes::gettimeofday() = ".($oSeconds * 1000 + int($oMicroseconds / 1000)));
say("microseconds Time::HiRes::gettimeofday() = ".($oSeconds * 1000000 + $oMicroseconds));

use POSIX qw/strftime/;

my @oGMTime = gmtime();
say("seconds POSIX::strftime('%s') = ".POSIX::strftime('%s',@oGMTime));
say("nanoseconds POSIX::strftime('%s%N') = ".POSIX::strftime('%s%N',@oGMTime));

1;