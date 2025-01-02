package AString;

use strict;
use warnings FATAL => 'all';


sub mContain {

    my ($inString,$inSubstring) = @_;

    if (CORE::index($inString,$inSubstring) != -1) {
        return($AConstants::TRUE);
    } else {
        return($AConstants::FALSE);
    }
}

1;