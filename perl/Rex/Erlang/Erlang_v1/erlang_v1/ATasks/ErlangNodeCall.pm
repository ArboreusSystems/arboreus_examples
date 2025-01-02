package ATasks::ErlangNodeCall;

use strict;
use warnings FATAL => 'all';


sub mRun {

	my ($inParameters) = @_;

	my $oNodeName = ATask::mCheckRequiredNodeNameParameter($inParameters);
	my $oCookie = ATask::mCheckRequiredCookieParameter($inParameters);
	my $oCode = ATask::mCheckRequiredCodeParameter($inParameters);

	Rex::Logger::info("----------------------------------");
	Rex::Logger::info("Erlang: Node call");

	my $oOutput = AErlang::ErlCall::mApply($oNodeName,$oCookie,$oCode);
	Rex::Logger::info($oOutput);

	return($AConstants::EXIT_SUCCESS)
}

1;