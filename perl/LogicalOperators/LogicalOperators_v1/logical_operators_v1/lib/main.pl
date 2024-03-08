#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use Data::Dumper;

print "--------------------------\n";
print "0: "; print 0 ? "yes" : "no"; print "\n";
print "1: "; print 1 ? "yes" : "no"; print "\n";
print "\'1\': "; print '1' ? "yes" : "no"; print "\n";
print "undef: "; print undef ? "yes" : "no"; print "\n";
print "\'undef\': "; print 'undef' ? "yes" : "no"; print "\n";

say "--------------------------";
say "1 == 0: ".(1 == 0 ? "yes" : "no");
say "1 != 0: ".(1 != 0 ? "yes" : "no");
say "1 > 0: ".(1 > 0 ? "yes" : "no");
say "1 < 0: ".(1 < 0 ? "yes" : "no");
say "1 >= 0: ".(1 >= 0 ? "yes" : "no");
say "1 <= 0: ".(1 <= 0 ? "yes" : "no");
say "1 <= 0: ".(1 <= 0 ? "yes" : "no");
say "1 <=> 0: ".(1 <=> 0 ? "yes" : "no");

say "--------------------------";
say "'a' eq '0': ".('a' eq '0' ? "yes" : "no");
say "'a' ne '0': ".('a' ne '0' ? "yes" : "no");
say "'a' eq 'a': ".('a' eq 'a' ? "yes" : "no");
say "'a' eq 'b': ".('a' eq 'b' ? "yes" : "no");
say "'a' lt 'b': ".('a' lt 'b' ? "yes" : "no");
say "'a' gt 'b': ".('a' gt 'b' ? "yes" : "no");

say "--------------------------";
say "1 > 0 && 2 > 3: ".(1 > 0 && 2 > 3 ? "yes" : "no");
say "1 > 0 || 2 > 3: ".(1 > 0 || 2 > 3 ? "yes" : "no");
say "1 > 0 || (2 > 3 || 1 > 0): ".(1 > 0 || (2 > 3 || 1 > 0) ? "yes" : "no");

1;

