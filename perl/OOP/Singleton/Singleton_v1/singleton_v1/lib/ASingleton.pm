package ASingleton;

use strict;
use warnings FATAL => 'all';

my $SingletonInstance = undef;

sub mGetInstance {

    $SingletonInstance = bless {}, shift unless defined $SingletonInstance;
    return $SingletonInstance;
}

1;