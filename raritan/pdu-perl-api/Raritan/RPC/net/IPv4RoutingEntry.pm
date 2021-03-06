# Do NOT edit this file!
# It was generated by IdlC from Net.idl.

use strict;

package Raritan::RPC::net::IPv4RoutingEntry;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'dest'} = "$in->{'dest'}";
    $encoded->{'nexthop'} = "$in->{'nexthop'}";
    $encoded->{'intf'} = "$in->{'intf'}";
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'dest'} = $in->{'dest'};
    $decoded->{'nexthop'} = $in->{'nexthop'};
    $decoded->{'intf'} = $in->{'intf'};
    return $decoded;
}

1;
