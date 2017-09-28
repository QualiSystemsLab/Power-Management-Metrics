# Do NOT edit this file!
# It was generated by IdlC from Net.idl.

use strict;

package Raritan::RPC::net::CommonInfo;

use Raritan::RPC::net::RoutingInfo;
use Raritan::RPC::net::PortForwardingInfo;
use Raritan::RPC::net::DnsInfo;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'dns'} = Raritan::RPC::net::DnsInfo::encode($in->{'dns'});
    $encoded->{'routing'} = Raritan::RPC::net::RoutingInfo::encode($in->{'routing'});
    $encoded->{'portForwarding'} = Raritan::RPC::net::PortForwardingInfo::encode($in->{'portForwarding'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'dns'} = Raritan::RPC::net::DnsInfo::decode($agent, $in->{'dns'});
    $decoded->{'routing'} = Raritan::RPC::net::RoutingInfo::decode($agent, $in->{'routing'});
    $decoded->{'portForwarding'} = Raritan::RPC::net::PortForwardingInfo::decode($agent, $in->{'portForwarding'});
    return $decoded;
}

1;