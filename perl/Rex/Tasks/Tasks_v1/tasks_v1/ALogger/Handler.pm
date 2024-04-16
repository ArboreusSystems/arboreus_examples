package ALogger::Handler;

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use AConfig::Handler;
use ATime::Timestamp;

our $NAME_LOGGER = 'Logger';
our $NAME_LOGGER_FOLDER = 'Folder';
our $NAME_LOGGER_DEBUG = 'Debug';

sub mInit {

	mInitLogFile();
	mInitDebug();

	$Rex::Logger::format = "%h %D [%l] %s";

	Rex::Logger::info("Logger initiated");
}

sub mInitLogFile {

	if (exists($AConfig::Handler::gProperties->{$NAME_LOGGER}{$NAME_LOGGER_FOLDER})) {
		Rex::Config->set_log_filename(
			$AConfig::Handler::gProperties->{$NAME_LOGGER}{$NAME_LOGGER_FOLDER}."/".
				ATime::Timestamp::get_timestamp_microseconds().".log"
		);
	}
}

sub mInitDebug {

	if (exists($AConfig::Handler::gProperties->{$NAME_LOGGER}{$NAME_LOGGER_DEBUG})) {
		$Rex::Logger::debug = $AConfig::Handler::gProperties->{$NAME_LOGGER}{$NAME_LOGGER_DEBUG}
	}
}

1;