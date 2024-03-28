package Uptime;

use strict;
use warnings FATAL => 'all';
use Rex -feature => [ '1.4' ];

sub mRun {

	my $output = Rex::Commands::Run::run('uptime');
	say $output;
}

1;