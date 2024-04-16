package ATime::Timestamp;

use strict;
use warnings FATAL => 'all';

sub get_timestamp_microseconds {

	my ($oSeconds,$oMicroseconds) = Time::HiRes::gettimeofday();
	return($oSeconds * 1000000 + $oMicroseconds);
}

1;