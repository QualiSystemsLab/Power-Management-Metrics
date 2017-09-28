# Do NOT edit this file!
# It was generated by IdlC from StateSensor.idl.

use strict;

package Raritan::RPC::sensors::StateSensor_2_0_0::State;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'timestamp'} = 1 * $in->{'timestamp'};
    $encoded->{'available'} = ($in->{'available'}) ? JSON::true : JSON::false;
    $encoded->{'value'} = 1 * $in->{'value'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'timestamp'} = $in->{'timestamp'};
    $decoded->{'available'} = ($in->{'available'}) ? 1 : 0;
    $decoded->{'value'} = $in->{'value'};
    return $decoded;
}

1;