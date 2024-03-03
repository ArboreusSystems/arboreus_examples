package ASingleton;

use strict;
use warnings FATAL => 'all';
use feature 'state';

sub mGetInstance {

    my ($oClass) = @_;
    state $oInstance;

    if (! defined $oInstance) {
        $oInstance = bless {}, $oClass;
    }

    return $oInstance;
}

1;