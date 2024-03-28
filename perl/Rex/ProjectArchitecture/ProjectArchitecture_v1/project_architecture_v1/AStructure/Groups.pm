package Groups;

use strict;
use warnings FATAL => 'all';

use Servers;

our $A_NAME_GROUP = 'a_group';
Rex::Commands::group(
	$A_NAME_GROUP =>
		$Servers::A_SERVER_001,
		$Servers::A_SERVER_002,
		$Servers::A_SERVER_003
);

1;