package ATasks::ErlangNodeHalt;

use strict;
use warnings FATAL => 'all';


sub mRun {

	my ($inParameters) = @_;

	my $oNodeName = ATask::mCheckRequiredNodeNameParameter($inParameters);
	my $oCookie = ATask::mCheckRequiredCookieParameter($inParameters);

	Rex::Logger::info("----------------------------------");
	Rex::Logger::info("Erlang: Node halt");

	my $oOutput = AErlang::ErlCall::mHalt($oNodeName,$oCookie);
	if (
		$oOutput eq "not_applied" ||
		$oOutput eq "node_not_started" ||
		$oOutput eq "error"
	) {
		Rex::Logger::info($oOutput,"error");
		return($AConstants::EXIT_FAILURE);
	}

	Rex::Logger::info($oOutput);
	return($AConstants::EXIT_SUCCESS)
}

1;