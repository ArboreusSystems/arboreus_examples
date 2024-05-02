#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use feature qw/say/;

use YAML;
use YAML::XS;
use Cwd;

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

my $oFile = Cwd::cwd()."/dump.yaml";
if (-f $oFile) {
	CORE::unlink($oFile);
}
YAML::DumpFile($oFile,{
	key1 => "value1",
	key2 => 2,
	key3 => [1,2,3,4],
	key4 => {
		key5 => 5,
		key6 => "six"
	}
});
say(Dump(YAML::XS::LoadFile($oFile)));

1;