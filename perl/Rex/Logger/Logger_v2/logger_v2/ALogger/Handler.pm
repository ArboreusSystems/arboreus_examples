package ALogger::Handler;

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use Data::Dumper;

use Rex -feature => [ '1.4' ];

my $oLoggerInstance = undef;

sub mGetInstance {

	$oLoggerInstance = bless {}, shift unless defined $oLoggerInstance;
	return $oLoggerInstance;
}

sub mSetRexLoggerDebug {

	my ($self,$inDebug) = @_;
	$Rex::Logger::debug = $inDebug;
}

sub mSetRexLoggerFormat {

	my ($self,$inFormat) = @_;
	$Rex::Logger::format = $inFormat;
}

sub mSetRexLoggerSilent {

	my ($self,$inSilent) = @_;
	$Rex::Logger::silent = $inSilent;
}

sub mSetRexLoggerNoColor {

	my ($self,$inNoColor) = @_;
	$Rex::Logger::no_color = $inNoColor;
}

sub mSetRexConfigAutoDie {

	my ($self,$inAutoDie) = @_;
	$Rex::Config::autodie = $inAutoDie;
}

sub mSetRexConfigLogFile {

	my ($self,$inLogFile) = @_;

	unless (-e $inLogFile) {
		open(my $oFileHandler,">",$inLogFile);
		close($oFileHandler);
	} else {
		unlink($inLogFile);
		open(my $oFileHandler,">",$inLogFile);
		close($oFileHandler);
	}

	Rex::Config->set_log_filename($inLogFile);
}

sub mDebug {

	my ($self,$inMessage) = @_;
	Rex::Logger::debug(
		ATime::Timestamp::mMicroseconds()." [DEBUG] ".$inMessage
	);
}

sub mInfo {

	my ($self,$inMessage) = @_;
	Rex::Logger::info(
		ATime::Timestamp::mMicroseconds()." [INFO] ".$inMessage
	);
}

sub mUser {

	my ($self,$inMessage) = @_;
	Rex::Logger::info(
		ATime::Timestamp::mMicroseconds()." [USER] ".$inMessage
	);
}

1;