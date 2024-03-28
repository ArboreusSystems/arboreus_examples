#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

use Rex -feature => [ '1.4' ];

BEGIN {

	use Cwd qw();
	push(@INC,Cwd::cwd());
	push(@INC,Cwd::cwd()."/AStructure");
};

use AStructure::Servers;
use AStructure::Groups;

Rex::Commands::desc("Get uptime server");
Rex::Commands::task('uptime',
	group => $Groups::A_NAME_GROUP,
	sub {
		my $output = Rex::Commands::Run::run('uptime');
		say $output;
	}
);

1;