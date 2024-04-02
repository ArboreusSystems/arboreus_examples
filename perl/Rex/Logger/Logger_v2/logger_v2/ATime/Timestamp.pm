package ATime::Timestamp;

use strict;
use warnings FATAL => 'all';
use Time::HiRes;

use Exporter qw/import/;
our @EXPORT_OK = qw/
	mSeconds mMilliseconds mMicroseconds
/;


sub mSeconds {

	my ($oSeconds,$oMicroseconds) = Time::HiRes::gettimeofday();
	return($oSeconds);
}

sub mMilliseconds {

	my ($oSeconds,$oMicroseconds) = Time::HiRes::gettimeofday();
	return($oSeconds * 1000 + $oMicroseconds % 1000);
}

sub mMicroseconds {

	my ($oSeconds,$oMicroseconds) = Time::HiRes::gettimeofday();
	return($oSeconds * 1000000 + $oMicroseconds);
}

1;