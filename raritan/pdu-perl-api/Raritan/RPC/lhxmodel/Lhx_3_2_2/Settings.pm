# Do NOT edit this file!
# It was generated by IdlC from Lhx.idl.

use strict;

package Raritan::RPC::lhxmodel::Lhx_3_2_2::Settings;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'setpointWaterValve'} = 1 * $in->{'setpointWaterValve'};
    $encoded->{'setpointVentilators'} = 1 * $in->{'setpointVentilators'};
    $encoded->{'defaultFanSpeed'} = 1 * $in->{'defaultFanSpeed'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'setpointWaterValve'} = $in->{'setpointWaterValve'};
    $decoded->{'setpointVentilators'} = $in->{'setpointVentilators'};
    $decoded->{'defaultFanSpeed'} = $in->{'defaultFanSpeed'};
    return $decoded;
}

1;
