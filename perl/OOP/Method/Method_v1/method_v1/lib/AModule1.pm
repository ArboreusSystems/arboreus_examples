package AModule1;

use strict;
use warnings FATAL => 'all';

use Exporter qw/import/;
our @EXPORT = qw/mSum/;

sub mSum {

	my ($inNumber1,$inNumber2) = @_;
	return $inNumber1 + $inNumber2;
}

1;