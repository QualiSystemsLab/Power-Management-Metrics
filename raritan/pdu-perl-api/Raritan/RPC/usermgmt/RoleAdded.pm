# Do NOT edit this file!
# It was generated by IdlC from RoleManager.idl.

use strict;

package Raritan::RPC::usermgmt::RoleAdded;

use constant typeId => "usermgmt.RoleAdded:1.0.0";
use Raritan::RPC::usermgmt::RoleEvent;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::usermgmt::RoleEvent::encode($in);
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::usermgmt::RoleEvent::decode($agent, $in);
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('usermgmt.RoleAdded', 1, 0, 0, 'Raritan::RPC::usermgmt::RoleAdded');
1;