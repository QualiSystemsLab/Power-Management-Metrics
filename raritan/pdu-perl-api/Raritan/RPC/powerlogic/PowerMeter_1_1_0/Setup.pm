# Do NOT edit this file!
# It was generated by IdlC from PowerLogicPowerMeter.idl.

use strict;

package Raritan::RPC::powerlogic::PowerMeter_1_1_0::Setup;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'systemType'} = 1 * $in->{'systemType'};
    $encoded->{'displayMode'} = 1 * $in->{'displayMode'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'systemType'} = $in->{'systemType'};
    $decoded->{'displayMode'} = $in->{'displayMode'};
    return $decoded;
}

1;
