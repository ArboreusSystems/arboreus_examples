#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use DateTime::HiRes;

my $oTimeNow = DateTime::HiRes->now();

say("\$oTimeNow->strftime('%Y-%m-%d') = ".$oTimeNow->strftime('%Y-%m-%d'));
say("\$oTimeNow->strftime('%Y-%m-%d-%H-%M-%S') = ".$oTimeNow->strftime('%Y-%m-%d-%H-%M-%S'));

say("%a = ".$oTimeNow->strftime('%a')." -> The abbreviated weekday name according to the current locale.");
say("%A = ".$oTimeNow->strftime('%A')." -> The full weekday name according to the current locale.");
say("%b = ".$oTimeNow->strftime('%b')." -> The abbreviated month name according to the current locale.");
say("%B = ".$oTimeNow->strftime('%B')." -> The full month name according to the current locale.");
say("%c = ".$oTimeNow->strftime('%c')." -> The preferred date and time representation for the current locale.");
say("%C = ".$oTimeNow->strftime('%C')." -> The century number (year/100) as a 2-digit integer. (SU)");
say("%d = ".$oTimeNow->strftime('%d')." -> The day of the month as a decimal number (range 01 to 31).");
say("%D = ".$oTimeNow->strftime('%D')." -> Equivalent to %m/%d/%y.");
say("%e = ".$oTimeNow->strftime('%e')." -> Like %d, the day of the month as a decimal number, but a leading zero is replaced by a space. (SU)");
say("%E = ".$oTimeNow->strftime('%E')." -> Modifier: use alternative format, see below. (SU)");
say("%F = ".$oTimeNow->strftime('%F')." -> Equivalent to %Y-%m-%d (the ISO 8601 date format). (C99)");
say("%G = ".$oTimeNow->strftime('%G')." -> The ISO 8601 week-based year (see NOTES) with century as a decimal number.");
say("%g = ".$oTimeNow->strftime('%g')." -> Like %G, but without century, that is, with a 2-digit year (00-99). (TZ)");
say("%h = ".$oTimeNow->strftime('%h')." -> Equivalent to %b. (SU)");
say("%H = ".$oTimeNow->strftime('%H')." -> The hour as a decimal number using a 24-hour clock (range 00 to 23).");
say("%I = ".$oTimeNow->strftime('%I')." -> The hour as a decimal number using a 12-hour clock (range 01 to 12).");
say("%j = ".$oTimeNow->strftime('%j')." -> The day of the year as a decimal number (range 001 to 366).");
say("%k = ".$oTimeNow->strftime('%D')." -> The hour (24-hour clock) as a decimal number (range 0 to 23); single digits are preceded by a blank. (See also %H.) (TZ)");
say("%l = ".$oTimeNow->strftime('%l')." -> The hour (12-hour clock) as a decimal number (range 1 to 12); single digits are preceded by a blank. (See also %I.) (TZ)");
say("%m = ".$oTimeNow->strftime('%m')." -> The month as a decimal number (range 01 to 12).");
say("%M = ".$oTimeNow->strftime('%M')." -> The minute as a decimal number (range 00 to 59).");
say("%n = ".$oTimeNow->strftime('%n')." -> A newline character. (SU)");
say("%N = ".$oTimeNow->strftime('%N')." -> Nanoseconds (range 000000000 to 999999999).");
say("%O = ".$oTimeNow->strftime('%O')." -> Modifier: use alternative format, see below. (SU)");
say("%p = ".$oTimeNow->strftime('%p')." -> Either \"AM\" or \"PM\" according to the given time value, or the corresponding strings for the current locale.");
say("%P = ".$oTimeNow->strftime('%P')." -> Like %p but in lowercase: \"am\" or \"pm\" or a corresponding string for the current locale. (GNU)");
say("%r = ".$oTimeNow->strftime('%r')." -> The time in a.m. or p.m. notation. In the POSIX locale this is equivalent to %I:%M:%S %p. (SU)");
say("%R = ".$oTimeNow->strftime('%R')." -> The time in 24-hour notation (%H:%M). (SU) For a version including the seconds, see %T below.");
say("%s = ".$oTimeNow->strftime('%s')." -> The number of seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC). (TZ)");
say("%S = ".$oTimeNow->strftime('%S')." -> The second as a decimal number (range 00 to 60). (The range is up to 60 to allow for occasional leap seconds.)");
say("%t = ".$oTimeNow->strftime('%t')." -> A tab character. (SU)");
say("%T = ".$oTimeNow->strftime('%T')." -> The time in 24-hour notation (%H:%M:%S). (SU)");
say("%u = ".$oTimeNow->strftime('%u')." -> The day of the week as a decimal, range 1 to 7, Monday being 1. See also %w. (SU)");
say("%U = ".$oTimeNow->strftime('%U')." -> The week number of the current year as a decimal number, range 00 to 53. See also %V and %W.");
say("%V = ".$oTimeNow->strftime('%V')." -> The ISO 8601 week number.");
say("%w = ".$oTimeNow->strftime('%w')." -> The day of the week as a decimal, range 0 to 6, Sunday being 0. See also %u.");
say("%W = ".$oTimeNow->strftime('%W')." -> The week number of the current year as a decimal number, range 00 to 53.");
say("%x = ".$oTimeNow->strftime('%x')." -> The preferred date representation for the current locale without the time.");
say("%X = ".$oTimeNow->strftime('%X')." -> The preferred time representation for the current locale without the date.");
say("%y = ".$oTimeNow->strftime('%y')." -> The year as a decimal number without a century (range 00 to 99).");
say("%Y = ".$oTimeNow->strftime('%Y')." -> The year as a decimal number including the century.");
say("%z = ".$oTimeNow->strftime('%z')." -> The +hhmm or -hhmm numeric timezone (that is, the hour and minute offset from UTC). (SU)");
say("%Z = ".$oTimeNow->strftime('%Z')." -> The timezone or name or abbreviation.");
say("%+ = ".$oTimeNow->strftime('%+')." -> The timezone or name or abbreviation.");
say("%% = ".$oTimeNow->strftime('%%')." -> A literal % character.");

1;
