#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Rex -feature => [ '1.4' ];

BEGIN {

	use Cwd qw();
	push(@INC,Cwd::cwd());
	push(@INC,Cwd::cwd()."/AStructure");
	push(@INC,Cwd::cwd()."/ATasks");
};

use AStructure::Servers;
use AStructure::Groups;

use ATasks::Uptime;

Rex::Commands::desc("Get uptime server");
Rex::Commands::task('uptime',
	group => $AStructure::Groups::A_NAME_GROUP_BUILDER,
	sub {
		ATasks::Uptime::mRun();
	}
);

1;