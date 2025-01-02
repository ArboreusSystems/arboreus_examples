package AConfig::Module;

use strict;
use warnings FATAL => 'all';

use YAML::XS 'LoadFile';

my $gInstance = undef;
our $gProperties;

sub mInstance {

    $gInstance = bless {}, shift unless defined $gInstance;
    return $gInstance;
}

sub mLoadConfig {

    my ($self,$inPath) = @_;

    my $oConfigFile = $inPath."/Rexfile.conf";
    if (-f $oConfigFile) {
        $gProperties = YAML::XS::LoadFile($oConfigFile);
        return 1;
    } else {
        return undef;
    }
}

1;