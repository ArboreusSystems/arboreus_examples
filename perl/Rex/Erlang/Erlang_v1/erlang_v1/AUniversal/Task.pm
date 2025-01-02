package ATask;

use strict;
use warnings FATAL => 'all';


sub mCheckRequiredParameter {

    my ($inParameters,$inName) = @_;

    my $oStringParameter = $inParameters->{$inName};
    if (!defined($oStringParameter)) {
        Rex::Logger::info("No required parameter '".$inName."'","error");
        CORE::exit($AConstants::EXIT_BY_FORCE_CODE);
    } else {
        if ($oStringParameter eq "") {
            Rex::Logger::info("Empty value of '".$inName."'","error");
            CORE::exit($AConstants::EXIT_BY_FORCE_CODE);
        }
    }

    return($oStringParameter);
}

sub mCheckOptionalParameter {

    my ($inParameters,$inName,$inDefault) = @_;

    my $oStringParameter = $inParameters->{$inName};
    if (!defined($oStringParameter)) {
        if (defined($inDefault)) {
            return($inDefault);
        }
    } else {
        if ($oStringParameter eq "") {
            Rex::Logger::info("Empty value of '".$inName."'","error");
            CORE::exit($AConstants::EXIT_BY_FORCE_CODE);
        }
    }

    return($oStringParameter);
}

sub mCheckRequiredNodeNameParameter {

    my ($inParameters) = @_;
    return(mCheckRequiredParameter($inParameters,"node_name"));
}

sub mCheckRequiredCookieParameter {

    my ($inParameters) = @_;
    return(mCheckRequiredParameter($inParameters,"cookie"));
}

sub mCheckRequiredCodeParameter {

    my ($inParameters) = @_;
    return(mCheckRequiredParameter($inParameters,"code"));
}

1;