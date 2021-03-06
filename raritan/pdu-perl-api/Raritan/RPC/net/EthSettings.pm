# Do NOT edit this file!
# It was generated by IdlC from Net.idl.

use strict;

package Raritan::RPC::net::EthSettings;

use Raritan::RPC::net::EthLinkMode;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'linkMode'} = Raritan::RPC::net::EthLinkMode::encode($in->{'linkMode'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'linkMode'} = Raritan::RPC::net::EthLinkMode::decode($agent, $in->{'linkMode'});
    return $decoded;
}

1;
