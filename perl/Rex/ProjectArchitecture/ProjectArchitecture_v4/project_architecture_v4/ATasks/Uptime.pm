package ATasks::Uptime;

use strict;
use warnings FATAL => 'all';

sub mRun {

	my ($self) = @_;
	my $output = Rex::Commands::Run::run('uptime');
	say $output;
}

1;