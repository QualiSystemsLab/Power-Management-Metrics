# Do NOT edit this file!
# It was generated by IdlC from Lhx.idl.

use strict;

package Raritan::RPC::lhxmodel::Lhx_3_0_0::ParamCfg;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'min'} = 1 * $in->{'min'};
    $encoded->{'max'} = 1 * $in->{'max'};
    $encoded->{'decdigits'} = 1 * $in->{'decdigits'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'min'} = $in->{'min'};
    $decoded->{'max'} = $in->{'max'};
    $decoded->{'decdigits'} = $in->{'decdigits'};
    return $decoded;
}

1;
