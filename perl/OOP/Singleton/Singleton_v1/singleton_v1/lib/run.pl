#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use ASingleton;

my $oSingleton1 = ASingleton->mGetInstance;
$oSingleton1->{FavoriteColor} = 'SkyBlue';

my $oSingleton2 = ASingleton->mGetInstance;
print "Favorite color: ".$oSingleton2->{FavoriteColor}."\n";

1;
