#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use Data::Dumper;

use Parallel::ForkManager;

my $oManager = Parallel::ForkManager->new(2);
my @oGoods = ( "milk", "bread", "eggs", "beef", "cheese", "tomato" );

foreach (@oGoods)  {
	my $iPid = $oManager->start;
	if (defined $iPid) {
		say "$$: Child created with pid $iPid for ".$_;
	} else {
		say "$$: Process started with ".$_." and ($iPid)";
	}
	$oManager->finish;
}

$oManager->wait_all_children();