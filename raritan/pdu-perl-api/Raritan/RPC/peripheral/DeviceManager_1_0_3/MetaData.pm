# Do NOT edit this file!
# It was generated by IdlC from PeripheralDeviceManager.idl.

use strict;

package Raritan::RPC::peripheral::DeviceManager_1_0_3::MetaData;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'oneWirePortCount'} = 1 * $in->{'oneWirePortCount'};
    $encoded->{'onboardDeviceCount'} = 1 * $in->{'onboardDeviceCount'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'oneWirePortCount'} = $in->{'oneWirePortCount'};
    $decoded->{'onboardDeviceCount'} = $in->{'onboardDeviceCount'};
    return $decoded;
}

1;
