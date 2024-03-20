package APackage2;

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use Data::Dumper;

sub mInstance {

	say(Dumper(@_));

	my (
		$class,
		$inParameter1,$inParameter2,
		$inParameter3,$inParameter4,
	) = @_;

	my $self = {
		inParameter1 => $inParameter1,
		inParameter2 => $inParameter2,
		inParameter3 => $inParameter3,
		inParameter4 => $inParameter4
	};

	bless($self,$class);

	return($self);
}

sub inParameter1 {

	my $self = shift;
	return($self->{inParameter1});
}

sub inParameter2 {

	my $self = shift;
	return($self->{inParameter2});
}

sub inParameter3 {

	my $self = shift;
	return($self->{inParameter3});
}

sub inParameter4 {

	my $self = shift;
	return($self->{inParameter4});
}

1;