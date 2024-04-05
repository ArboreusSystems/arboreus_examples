#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

use Config;
if ($Config{usethreads}) {
	print "has thread support\n"
}

use Config qw(myconfig config_sh config_vars config_re);

print Config::myconfig();
# print Config::config_sh();
# print Config::config_re();

Config::config_vars(qw(osname archname));

1;