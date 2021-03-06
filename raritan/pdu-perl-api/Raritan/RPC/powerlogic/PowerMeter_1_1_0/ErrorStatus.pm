# Do NOT edit this file!
# It was generated by IdlC from PowerLogicPowerMeter.idl.

use strict;

package Raritan::RPC::powerlogic::PowerMeter_1_1_0::ErrorStatus;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'vL1saturation'} = ($in->{'vL1saturation'}) ? JSON::true : JSON::false;
    $encoded->{'vL2saturation'} = ($in->{'vL2saturation'}) ? JSON::true : JSON::false;
    $encoded->{'vL3saturation'} = ($in->{'vL3saturation'}) ? JSON::true : JSON::false;
    $encoded->{'cL1saturation'} = ($in->{'cL1saturation'}) ? JSON::true : JSON::false;
    $encoded->{'cL2saturation'} = ($in->{'cL2saturation'}) ? JSON::true : JSON::false;
    $encoded->{'cL3saturation'} = ($in->{'cL3saturation'}) ? JSON::true : JSON::false;
    $encoded->{'freqInvalid'} = ($in->{'freqInvalid'}) ? JSON::true : JSON::false;
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'vL1saturation'} = ($in->{'vL1saturation'}) ? 1 : 0;
    $decoded->{'vL2saturation'} = ($in->{'vL2saturation'}) ? 1 : 0;
    $decoded->{'vL3saturation'} = ($in->{'vL3saturation'}) ? 1 : 0;
    $decoded->{'cL1saturation'} = ($in->{'cL1saturation'}) ? 1 : 0;
    $decoded->{'cL2saturation'} = ($in->{'cL2saturation'}) ? 1 : 0;
    $decoded->{'cL3saturation'} = ($in->{'cL3saturation'}) ? 1 : 0;
    $decoded->{'freqInvalid'} = ($in->{'freqInvalid'}) ? 1 : 0;
    return $decoded;
}

1;
