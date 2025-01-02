package AErlang::ErlCall;

use strict;
use warnings FATAL => 'all';


sub mApply {

	my ($inNode,$inCookie,$inCode) = @_;
	my $oOutput = "not_applied";

	if (AErlang::Epmd::mIsNodeStarted($inNode)) {
		my $oCommand = "erl_call -n '$inNode' -c $inCookie -s -a '$inCode'";
		Rex::Logger::info("Running command");
		Rex::Logger::info($oCommand);
		$oOutput = Rex::Commands::Run::run($oCommand);
	} else {
		$oOutput = "node_not_started";
	}

	return($oOutput);
}

sub mHalt {

	my ($inNodeName,$inCookie) = @_;
	my $oOutput = "not_applied";

	my $oHaltResult = mApply($inNodeName,$inCookie,'erlang halt');
	if ($oHaltResult eq "not_applied" || $oHaltResult eq "node_not_started") {
		$oOutput = $oHaltResult;
	} else {
		if (AErlang::Epmd::mIsNodeStarted($inNodeName)) {
			$oOutput = "error";
		} else {
			$oOutput = "ok";
		}
	}

	return($oOutput);
}

1;