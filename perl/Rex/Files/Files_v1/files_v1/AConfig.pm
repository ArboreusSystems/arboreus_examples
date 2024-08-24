package AConfig;

use strict;
use warnings FATAL => 'all';
use feature qw/say/;
use YAML::XS 'LoadFile';

my $gNameConfigFile = undef;
my $gInstance = undef;
our $gDirRoot = undef;
our $gProperties = undef;


sub mInstance {

	my ($self,$inConfigFileName) = @_;
	$gNameConfigFile = $inConfigFileName;
	$gInstance = bless {}, shift unless defined $gInstance;
	return $gInstance;
}

sub mLoadConfig {

	if (!defined $gNameConfigFile) {
		say("Config filename NOT defined");
		return undef;
	} else {
		my ($self,$inPath) = @_;
		my $oConfigFile = $inPath."/".$gNameConfigFile;
		if (-f $oConfigFile) {
			$gProperties = YAML::XS::LoadFile($oConfigFile);
			$gDirRoot = $inPath;
			return 1;
		} else {
			return undef;
		}
	}
}

1;