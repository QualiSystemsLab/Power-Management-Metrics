# Do NOT edit this file!
# It was generated by IdlC from Net.idl.

use strict;

package Raritan::RPC::net::InterfaceIpSettings;

use Raritan::RPC::net::IpAddrCidr;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'enabled'} = ($in->{'enabled'}) ? JSON::true : JSON::false;
    $encoded->{'configMethod'} = $in->{'configMethod'};
    $encoded->{'staticAddrCidr'} = Raritan::RPC::net::IpAddrCidr::encode($in->{'staticAddrCidr'});
    $encoded->{'dhcpPreferredHostname'} = "$in->{'dhcpPreferredHostname'}";
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'enabled'} = ($in->{'enabled'}) ? 1 : 0;
    $decoded->{'configMethod'} = $in->{'configMethod'};
    $decoded->{'staticAddrCidr'} = Raritan::RPC::net::IpAddrCidr::decode($agent, $in->{'staticAddrCidr'});
    $decoded->{'dhcpPreferredHostname'} = $in->{'dhcpPreferredHostname'};
    return $decoded;
}

1;