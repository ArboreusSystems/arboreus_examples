package AStructure::Groups;

use strict;
use warnings FATAL => 'all';

use Servers;

our $A_NAME_GROUP = 'a_group';
Rex::Commands::group(
	$A_NAME_GROUP =>
		$AStructure::Servers::A_SERVER_001,
		$AStructure::Servers::A_SERVER_002,
		$AStructure::Servers::A_SERVER_003
);

1;