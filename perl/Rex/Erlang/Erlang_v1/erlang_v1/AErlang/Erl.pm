package AErlang::Erl;

use strict;
use warnings FATAL => 'all';

sub mNodeStart {

	my ($inNodeName,$inCookie) = @_;
	my $oOutput = "not_applied";

	if (AErlang::Epmd::mIsNodeStarted($inNodeName)) {
		$oOutput = "node_already_started";
	} else {
		my $oCommand = "erl -noshell -name $inNodeName -setcookie $inCookie -detached";
		Rex::Logger::info("Running command");
		Rex::Logger::info($oCommand);
		Rex::Commands::Run::run($oCommand);
		CORE::sleep(1);
		if (AErlang::Epmd::mIsNodeStarted($inNodeName)) {
			$oOutput = "started";
		} else {
			$oOutput = "error";
		}
	}

	return($oOutput);
}

sub mNodeStartWithEval {

	my ($inNodeName,$inCookie,$inCode) = @_;
	my $oOutput = "not_applied";

	if (AErlang::Epmd::mIsNodeStarted($inNodeName)) {
		$oOutput = "node_already_started";
	} else {
		my $oCommand = "erl -noshell -name $inNodeName -setcookie $inCookie -eval '$inCode' -detached";
		Rex::Logger::info("Running command");
		Rex::Logger::info($oCommand);
		Rex::Commands::Run::run($oCommand);
		CORE::sleep(1);
		if (AErlang::Epmd::mIsNodeStarted($inNodeName)) {
			$oOutput = "started";
		} else {
			$oOutput = "error";
		}
	}

	return($oOutput);
}

sub mEval {

	my ($inCode) = @_;
	my $oCommand = "erl -noinput -eval '".$inCode."' -s init stop";
	return(Rex::Commands::Run::run($oCommand));
}

sub mCodeLibDir {

	return(mEval("io:format(code:lib_dir())."));
}

sub mCodeRootDir {

	return(mEval("io:format(code:root_dir())."));
}

sub mCodeRootIncludeDir {

	return(mCodeRootDir()."/usr/include");
}

sub mCodeRootLibDir {

	return(mCodeRootDir()."/usr/lib");
}

1;