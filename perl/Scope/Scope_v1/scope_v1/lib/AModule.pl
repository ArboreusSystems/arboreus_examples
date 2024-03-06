#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

print("Printed by AModule\n");

our($oMainVariable1);
print("Printed oMainVariable1 in AModule: ".$oMainVariable1."\n");

1;
