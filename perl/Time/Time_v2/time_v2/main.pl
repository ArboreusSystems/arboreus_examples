#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use Data::Dumper;

use POSIX qw/strftime/;

my @oTime = gmtime();

say("\$oTime = ".@oTime);
say("POSIX::strftime('%Y-%m-%d',\$oTime) = ".POSIX::strftime('%Y-%m-%d',@oTime));
say("POSIX::strftime('%Y-%m-%d-%H-%M-%S',\$oTime) = ".POSIX::strftime('%Y-%m-%d-%H-%M-%S',@oTime));

say("%a = ".POSIX::strftime('%a', @oTime)." -> The abbreviated weekday name according to the current locale.");
say("%A = ".POSIX::strftime('%A', @oTime)." -> The full weekday name according to the current locale.");
say("%b = ".POSIX::strftime('%b', @oTime)." -> The abbreviated month name according to the current locale.");
say("%B = ".POSIX::strftime('%B', @oTime)." -> The full month name according to the current locale.");
say("%c = ".POSIX::strftime('%c', @oTime)." -> The preferred date and time representation for the current locale.");
say("%C = ".POSIX::strftime('%C', @oTime)." -> The century number (year/100) as a 2-digit integer. (SU)");
say("%d = ".POSIX::strftime('%d', @oTime)." -> The day of the month as a decimal number (range 01 to 31).");
say("%D = ".POSIX::strftime('%D', @oTime)." -> Equivalent to %m/%d/%y.");
say("%e = ".POSIX::strftime('%e', @oTime)." -> Like %d, the day of the month as a decimal number, but a leading zero is replaced by a space. (SU)");
say("%E = ".POSIX::strftime('%E', @oTime)." -> Modifier: use alternative format, see below. (SU)");
say("%F = ".POSIX::strftime('%F', @oTime)." -> Equivalent to %Y-%m-%d (the ISO 8601 date format). (C99)");
say("%G = ".POSIX::strftime('%G', @oTime)." -> The ISO 8601 week-based year (see NOTES) with century as a decimal number.");
say("%g = ".POSIX::strftime('%g', @oTime)." -> Like %G, but without century, that is, with a 2-digit year (00-99). (TZ)");
say("%h = ".POSIX::strftime('%h', @oTime)." -> Equivalent to %b. (SU)");
say("%H = ".POSIX::strftime('%H', @oTime)." -> The hour as a decimal number using a 24-hour clock (range 00 to 23).");
say("%I = ".POSIX::strftime('%I', @oTime)." -> The hour as a decimal number using a 12-hour clock (range 01 to 12).");
say("%j = ".POSIX::strftime('%j', @oTime)." -> The day of the year as a decimal number (range 001 to 366).");
say("%k = ".POSIX::strftime('%D', @oTime)." -> The hour (24-hour clock) as a decimal number (range 0 to 23); single digits are preceded by a blank. (See also %H.) (TZ)");
say("%l = ".POSIX::strftime('%l', @oTime)." -> The hour (12-hour clock) as a decimal number (range 1 to 12); single digits are preceded by a blank. (See also %I.) (TZ)");
say("%m = ".POSIX::strftime('%m', @oTime)." -> The month as a decimal number (range 01 to 12).");
say("%M = ".POSIX::strftime('%M', @oTime)." -> The minute as a decimal number (range 00 to 59).");
say("%n = ".POSIX::strftime('%n', @oTime)." -> A newline character. (SU)");
say("%N = ".POSIX::strftime('%N', @oTime)." -> Nanoseconds (range 000000000 to 999999999).");
say("%O = ".POSIX::strftime('%O', @oTime)." -> Modifier: use alternative format, see below. (SU)");
say("%p = ".POSIX::strftime('%p', @oTime)." -> Either \"AM\" or \"PM\" according to the given time value, or the corresponding strings for the current locale.");
say("%P = ".POSIX::strftime('%P', @oTime)." -> Like %p but in lowercase: \"am\" or \"pm\" or a corresponding string for the current locale. (GNU)");
say("%r = ".POSIX::strftime('%r', @oTime)." -> The time in a.m. or p.m. notation. In the POSIX locale this is equivalent to %I:%M:%S %p. (SU)");
say("%R = ".POSIX::strftime('%R', @oTime)." -> The time in 24-hour notation (%H:%M). (SU) For a version including the seconds, see %T below.");
say("%s = ".POSIX::strftime('%s', @oTime)." -> The number of seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC). (TZ)");
say("%S = ".POSIX::strftime('%S', @oTime)." -> The second as a decimal number (range 00 to 60). (The range is up to 60 to allow for occasional leap seconds.)");
say("%t = ".POSIX::strftime('%t', @oTime)." -> A tab character. (SU)");
say("%T = ".POSIX::strftime('%T', @oTime)." -> The time in 24-hour notation (%H:%M:%S). (SU)");
say("%u = ".POSIX::strftime('%u', @oTime)." -> The day of the week as a decimal, range 1 to 7, Monday being 1. See also %w. (SU)");
say("%U = ".POSIX::strftime('%U', @oTime)." -> The week number of the current year as a decimal number, range 00 to 53. See also %V and %W.");
say("%V = ".POSIX::strftime('%V', @oTime)." -> The ISO 8601 week number.");
say("%w = ".POSIX::strftime('%w', @oTime)." -> The day of the week as a decimal, range 0 to 6, Sunday being 0. See also %u.");
say("%W = ".POSIX::strftime('%W', @oTime)." -> The week number of the current year as a decimal number, range 00 to 53.");
say("%x = ".POSIX::strftime('%x', @oTime)." -> The preferred date representation for the current locale without the time.");
say("%X = ".POSIX::strftime('%X', @oTime)." -> The preferred time representation for the current locale without the date.");
say("%y = ".POSIX::strftime('%y', @oTime)." -> The year as a decimal number without a century (range 00 to 99).");
say("%Y = ".POSIX::strftime('%Y', @oTime)." -> The year as a decimal number including the century.");
say("%z = ".POSIX::strftime('%z', @oTime)." -> The +hhmm or -hhmm numeric timezone (that is, the hour and minute offset from UTC). (SU)");
say("%Z = ".POSIX::strftime('%Z', @oTime)." -> The timezone or name or abbreviation.");
say("%+ = ".POSIX::strftime('%+', @oTime)." -> The timezone or name or abbreviation.");
say("%% = ".POSIX::strftime('%%', @oTime)." -> A literal % character.");

1;
