package AModuleOne::PackageBBB;

use strict;
use warnings FATAL => 'all';

use AModuleOne::PackageAAA;

sub mTest {

	AModuleOne::PackageAAA::mTest();
}

1;