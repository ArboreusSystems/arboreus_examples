package AErlang::Epmd;

use strict;
use warnings FATAL => 'all';

use AUniversal::String;


sub mStart {

    if (mIsStarted()) {
        Rex::Logger::info("Epmd already started");
        return($AConstants::EXIT_SUCCESS);
    }

    my (%inParameters) = @_;

    my $oParameterAddress = "";
    if (CORE::exists($inParameters{$AConstants::NAME_ADDRESS})) {
        my $oAddressList = $inParameters{$AConstants::NAME_ADDRESS};
        $oParameterAddress = " -address $oAddressList";
    }

    my $oParameterPort = "";
    if (CORE::exists($inParameters{$AConstants::NAME_PORT})) {
        my $oPortNumber = $inParameters{$AConstants::NAME_PORT};
        $oParameterPort = " -port $oPortNumber";
    }

    my $oParameterDebug = "";
    if (CORE::exists($inParameters{$AConstants::NAME_DEBUG})) {
        if ($inParameters{$AConstants::NAME_DEBUG} == $AConstants::TRUE) {
            $oParameterDebug = " -debug";
        }
    }

    my $oParameterDaemon = "";
    if (CORE::exists($inParameters{$AConstants::NAME_DAEMON})) {
        if ($inParameters{$AConstants::NAME_DAEMON} == $AConstants::TRUE) {
            $oParameterDaemon = " -daemon";
        }
    }

    my $oParameterRelaxedCommandCheck = "";
    if (CORE::exists($inParameters{$AConstants::NAME_RELAXED_COMMAND_CHECK})) {
        if ($inParameters{$AConstants::NAME_RELAXED_COMMAND_CHECK} == $AConstants::TRUE) {
            $oParameterRelaxedCommandCheck = " -relaxed_command_check";
        }
    }

    my $oParameterDisableSyslog = "";
    if (CORE::exists($inParameters{$AConstants::NAME_DISABLE_SYSLOG})) {
        if ($inParameters{$AConstants::NAME_DISABLE_SYSLOG} == $AConstants::TRUE) {
            $oParameterDisableSyslog = " -disable_syslog";
        }
    }

    my $oCommand = "epmd".
        $oParameterDebug.
        $oParameterAddress.
        $oParameterPort.
        $oParameterDaemon.
        $oParameterRelaxedCommandCheck.
        $oParameterDisableSyslog;

    Rex::Logger::info("Starting Erlang epmd with command:");
    Rex::Logger::info($oCommand);
    Rex::Commands::Run::run($oCommand);
    CORE::sleep(2);

    my $oCheckEpmd = Rex::Commands::Run::run('ps -x | grep epmd');
    if (AString::mContain($oCheckEpmd,$oCommand) == $AConstants::TRUE) {
        Rex::Logger::info("Epmd started:");
        Rex::Logger::info($oCheckEpmd);
        return($AConstants::EXIT_SUCCESS)
    } else {
        Rex::Logger::info("Can't start epmd.","error");
        return($AConstants::EXIT_FAILURE);
    }
}

sub mListOfNodes {

    my @oOutput;

    if (mIsStarted()) {
        my $oCommand = "epmd -names";
        my (undef,@oNodesData) = CORE::split("\n",Rex::Commands::Run::run($oCommand));
        foreach (@oNodesData) {
            my (undef,$iNodeName,undef,undef,undef) = CORE::split(" ",$_);
            CORE::push(@oOutput,$iNodeName)
        }
    }

    return(@oOutput);
}

sub mListOfNodesWithData {

    my @oOutput;

    if (mIsStarted()) {
        my $oCommand = "epmd -names";
        my (undef,@oNodesData) = CORE::split("\n",Rex::Commands::Run::run($oCommand));
        foreach(@oNodesData) {
            my (undef,$iName,undef,undef,$iPort) = CORE::split(" ",$_);
            my %iNodeData = ('name',$iName,'port',$iPort);
            CORE::push(@oOutput,%iNodeData)
        }
    }

    return(@oOutput);
}

sub mIsNodeStartedHandler {

    my ($inName,$inAttempts,$inPause) = @_;
    my $oOutput = $AConstants::FALSE;

    if (mIsStarted()) {
        for (my $i = 0; $i < $inAttempts; $i++) {
            if (CORE::grep(/^$inName$/,mListOfNodes())) {
                $oOutput = $AConstants::TRUE;
                CORE::last();
            } else {
                CORE::sleep($inPause);
            }
        }
    }

    return($oOutput);
}

sub mIsNodeStarted {

    my ($inName) = @_;
    return(mIsNodeStartedHandler($inName,5,0.1));
}

sub mIsStarted {

    my $oCommand = "epmd -names";
    my $oCommandOutput = Rex::Commands::Run::run($oCommand);
    if (AString::mContain($oCommandOutput,"epmd: up and running")) {
        return($AConstants::TRUE);
    } else {
        return($AConstants::FALSE);
    }
}

1;