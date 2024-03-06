#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use feature qw /signatures/;

sub mSubroutine1 {

    print("Called mSubroutine1\n");
}

sub mSubroutine2 {

    my @inArguments = @_;
    my $inParameter1 = $inArguments[0];
    my $inParameter2 = $inArguments[1];

    print("inParameter1: ".$inParameter1." inParameter2: ".$inParameter2."\n");
}

sub mSubroutine3 {

    my $inParameter = shift(@_);
    print("inParameter: ".$inParameter."\n");
}

sub mSubroutine4 {

    print(Dumper(@_));
}

sub mSubroutine5 {

    my @inArguments = @_;
    my $inParameter1 = $inArguments[0];
    my $inParameter2 = $inArguments[1];

    print(Dumper(@_));
    print("inParameter1: ".$inParameter1." inParameter2: ".$inParameter2."\n");
}

sub mSubroutine6 {

    mSubroutine1();
    print("Called mSubroutine6\n");
}

sub mSubroutine7 {

    return undef;
}

sub mSubroutine8 {

    my $oVariable1 = 1;
    my $oVariable2 = 2;

    $oVariable1 + $oVariable2;
}

sub mSubroutine9($inParameter1 = undef) {

	my $oOutput = "Got parameter: ";
	if (defined $inParameter1) {
		$oOutput = $oOutput.$inParameter1;
	} else {
		$oOutput = $oOutput."default parameter value";
	}
	return $oOutput."\n";
}

sub mSubroutine10(%inParameters) {

	print(Dumper(\%inParameters))
}

sub mSubroutine11($inParameter1,@inArguments) {

	print(Dumper($inParameter1));
	print(Dumper(\@inArguments))
}

mSubroutine1();
mSubroutine1;
mSubroutine2(1,"inParameterValue2");
mSubroutine2 1,"inParameterValue2";
mSubroutine3("inParameter");
mSubroutine3 "inParameter";
mSubroutine4("inParameter");
mSubroutine4 "inParameter";
mSubroutine5("inParameterValue1","inParameterValue2");
mSubroutine5 "inParameterValue1","inParameterValue2";
mSubroutine6();
mSubroutine6;

if (mSubroutine7) {
	print "undefined\n";
} else {
	print "defined\n";
}

if (!mSubroutine7) {
	print "undefined\n";
} else {
	print "defined\n";
}

print(mSubroutine8()."\n");

print(mSubroutine9());
print(mSubroutine9("TestParameter"));

mSubroutine10(
	1 => "inParameter1",
	2 => "inParameter2"
);

mSubroutine11("inParameter1",1,2,3,4,"inAnyValue");
mSubroutine11(1,2,3,4,"inAnyValue");

1;