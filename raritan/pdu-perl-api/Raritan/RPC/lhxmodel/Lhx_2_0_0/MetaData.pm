# Do NOT edit this file!
# It was generated by IdlC from Lhx.idl.

use strict;

package Raritan::RPC::lhxmodel::Lhx_2_0_0::MetaData;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'model'} = "$in->{'model'}";
    $encoded->{'version'} = "$in->{'version'}";
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'model'} = $in->{'model'};
    $decoded->{'version'} = $in->{'version'};
    return $decoded;
}

1;
