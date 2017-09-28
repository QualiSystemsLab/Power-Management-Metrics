# Do NOT edit this file!
# It was generated by IdlC from Net.idl.

use strict;

package Raritan::RPC::net::InterfaceInfo;

use Raritan::RPC::net::InterfaceIPv4Info;
use Raritan::RPC::net::InterfaceIPv6Info;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'name'} = "$in->{'name'}";
    $encoded->{'label'} = "$in->{'label'}";
    $encoded->{'type'} = $in->{'type'};
    $encoded->{'enabled'} = ($in->{'enabled'}) ? JSON::true : JSON::false;
    $encoded->{'masterIfName'} = "$in->{'masterIfName'}";
    $encoded->{'state'} = $in->{'state'};
    $encoded->{'macAddr'} = "$in->{'macAddr'}";
    $encoded->{'ipv4'} = Raritan::RPC::net::InterfaceIPv4Info::encode($in->{'ipv4'});
    $encoded->{'ipv6'} = Raritan::RPC::net::InterfaceIPv6Info::encode($in->{'ipv6'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'name'} = $in->{'name'};
    $decoded->{'label'} = $in->{'label'};
    $decoded->{'type'} = $in->{'type'};
    $decoded->{'enabled'} = ($in->{'enabled'}) ? 1 : 0;
    $decoded->{'masterIfName'} = $in->{'masterIfName'};
    $decoded->{'state'} = $in->{'state'};
    $decoded->{'macAddr'} = $in->{'macAddr'};
    $decoded->{'ipv4'} = Raritan::RPC::net::InterfaceIPv4Info::decode($agent, $in->{'ipv4'});
    $decoded->{'ipv6'} = Raritan::RPC::net::InterfaceIPv6Info::decode($agent, $in->{'ipv6'});
    return $decoded;
}

1;
