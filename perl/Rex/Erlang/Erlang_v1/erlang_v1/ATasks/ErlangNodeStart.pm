package ATasks::ErlangNodeStart;

use strict;
use warnings FATAL => 'all';

use AUniversal::Task;

sub mRun {

	my ($inParameters) = @_;

	my $oNodeName = ATask::mCheckRequiredNodeNameParameter($inParameters);
	my $oCookie = ATask::mCheckRequiredCookieParameter($inParameters);

	Rex::Logger::info("----------------------------------");
	Rex::Logger::info("Erlang: Node start");

	my $oOutput = AErlang::Erl::mNodeStart($oNodeName,$oCookie);
	if (
		$oOutput eq "not_applied" ||
		$oOutput eq "node_already_started" ||
		$oOutput eq "error"
	) {
		Rex::Logger::info($oOutput,"error");
		return(undef);
	}

	Rex::Logger::info($oOutput);
	return($AConstants::EXIT_SUCCESS)
}

1;