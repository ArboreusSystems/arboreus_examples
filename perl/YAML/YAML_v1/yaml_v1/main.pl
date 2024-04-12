#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use feature qw/say/;
use YAML;

say YAML::Dump( { ARRAY => ["str1","str2","str3"] });
say YAML::Dump( { WRONG_LIST => "str1","str2","str3" });
say YAML::Dump( { LIST => ("str1","str2","str3") });
say YAML::Dump( {
	ARRAY => [ "str1", "str2", "str3" ],
	HASH  => {
		KEY1 => "VALUE1",
		KEY1 => "VALUE2"
	}
});

1;