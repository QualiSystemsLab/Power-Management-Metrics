# Do NOT edit this file!
# It was generated by IdlC from PeripheralDeviceManager.idl.

use strict;

package Raritan::RPC::peripheral::DeviceManager_2_0_1::Statistics;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'cSumErrCnt'} = 1 * $in->{'cSumErrCnt'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'cSumErrCnt'} = $in->{'cSumErrCnt'};
    return $decoded;
}

1;
