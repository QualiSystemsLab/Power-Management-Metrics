# Do NOT edit this file!
# It was generated by IdlC from SensorLogger.idl.

use strict;

package Raritan::RPC::sensors::Logger_2_0_1::Record;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'available'} = ($in->{'available'}) ? JSON::true : JSON::false;
    $encoded->{'takenValidSamples'} = 1 * $in->{'takenValidSamples'};
    $encoded->{'state'} = 1 * $in->{'state'};
    $encoded->{'minValue'} = 1 * $in->{'minValue'};
    $encoded->{'avgValue'} = 1 * $in->{'avgValue'};
    $encoded->{'maxValue'} = 1 * $in->{'maxValue'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'available'} = ($in->{'available'}) ? 1 : 0;
    $decoded->{'takenValidSamples'} = $in->{'takenValidSamples'};
    $decoded->{'state'} = $in->{'state'};
    $decoded->{'minValue'} = $in->{'minValue'};
    $decoded->{'avgValue'} = $in->{'avgValue'};
    $decoded->{'maxValue'} = $in->{'maxValue'};
    return $decoded;
}

1;
