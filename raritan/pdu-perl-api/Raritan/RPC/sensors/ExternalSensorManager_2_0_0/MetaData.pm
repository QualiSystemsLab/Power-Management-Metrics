# Do NOT edit this file!
# It was generated by IdlC from ExternalSensorManager.idl.

use strict;

package Raritan::RPC::sensors::ExternalSensorManager_2_0_0::MetaData;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'onboardSensors'} = ($in->{'onboardSensors'}) ? JSON::true : JSON::false;
    $encoded->{'portCount'} = 1 * $in->{'portCount'};
    $encoded->{'isPowControlled'} = ($in->{'isPowControlled'}) ? JSON::true : JSON::false;
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'onboardSensors'} = ($in->{'onboardSensors'}) ? 1 : 0;
    $decoded->{'portCount'} = $in->{'portCount'};
    $decoded->{'isPowControlled'} = ($in->{'isPowControlled'}) ? 1 : 0;
    return $decoded;
}

1;
