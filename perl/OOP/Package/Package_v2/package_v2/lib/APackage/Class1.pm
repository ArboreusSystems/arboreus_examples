package APackage::Class1;

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use Data::Dumper;

sub mInstance {

	say("------------------------");
	say("Subroutine mInstance");
	say(Dumper(@_));

	my ($inClassName,%inArguments) = @_;
	my $self = \%inArguments;
	bless($self,$inClassName);
	return($self);
}

sub pProperty1 {

	say("------------------------");
	say("Subroutine pProperty1");
	say(Dumper(@_));

	my ($self,$inProperty1) = @_;
	if (@_ == 2) {
		$self->{pProperty1} = $inProperty1;
	}
	return($self->{pProperty1});
}

1;