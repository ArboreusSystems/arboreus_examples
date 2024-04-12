package AStructure::Groups;

use strict;
use warnings FATAL => 'all';

our $A_NAME_GROUP1 = 'Group1';
our $A_NAME_GROUP2 = 'Group2';
our $A_NAME_GROUP3 = 'Group3';

sub mGetGroup {

	my ($inGroup) = @_;
	return $AConfig::Handler::gProperties->{'Groups'}{$inGroup};
}

Rex::Commands::group(
	$A_NAME_GROUP1 => $AConfig::Handler::gProperties->{'Groups'}{$A_NAME_GROUP1}
);
Rex::Commands::group(
	$A_NAME_GROUP2 => $AConfig::Handler::gProperties->{'Groups'}{$A_NAME_GROUP2}
);
Rex::Commands::group(
	$A_NAME_GROUP3 => $AConfig::Handler::gProperties->{'Groups'}{$A_NAME_GROUP3}
);

1;