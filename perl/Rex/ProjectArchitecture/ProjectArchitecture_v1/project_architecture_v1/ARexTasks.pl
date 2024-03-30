#!/usr/bin/perl

use strict;
use warnings;
use feature qw(say);

BEGIN {

	use Cwd qw();
	push(@INC,Cwd::cwd());
	push(@INC,Cwd::cwd()."/AStructure");
	push(@INC,Cwd::cwd()."/AModule1");
};

use AStructure::Servers;
use AStructure::Groups;

# use AModule1::Package1 qw(:default);
# use AModule1::Package1 qw(:all);
use AModule1::Package1;

say(AModule1::Package1::mSumm(10,20));
say(AModule1::Package1::mTestString);

Rex::Commands::desc("Get uptime server");
Rex::Commands::task('uptime',
	group => $Groups::A_NAME_GROUP,
	sub {
		my $output = Rex::Commands::Run::run('uptime');
		say $output;
	}
);

1;
