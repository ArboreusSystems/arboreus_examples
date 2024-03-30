package AModule1::Package1;

use strict;
use warnings;

use Exporter qw(import);
our $VERSION = 1.00;
our @EXPORT_OK = qw(
	mSumm mTestString
);
our %EXPORT_TAGS = (
	default => [qw(
		mSumm
	)],
	all => [qw(
		mSumm mTestString
	)]
);

sub mSumm {

	my ($x, $y) = @_;
	return $x + $y;
}

sub mTestString {

	return "TestString";
}

1;
