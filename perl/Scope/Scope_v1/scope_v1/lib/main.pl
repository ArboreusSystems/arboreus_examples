#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

our $oMainVariable1 = "oMainVariable1";
require('AModule.pl');

print("Printed by main script\n");

1;