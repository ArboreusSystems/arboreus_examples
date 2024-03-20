package APackage::Class1;

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use Data::Dumper;

sub mInstance {

	my ($inClassName,%inArguments) = @_;
	my $self = \%inArguments;
	bless($self,$inClassName);
	return($self);
}

sub pProperty1 {

	my ($self,$inProperty1) = @_;
	if (@_ == 2) {
		$self->{pProperty1} = $inProperty1;
	}
	return($self->{pProperty1});
}

1;