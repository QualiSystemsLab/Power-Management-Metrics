# Do NOT edit this file!
# It was generated by IdlC from AssetStrip.idl.

use strict;

package Raritan::RPC::assetmgrmodel::AssetStrip::DeviceInfo;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'deviceId'} = 1 * $in->{'deviceId'};
    $encoded->{'hardwareId'} = 1 * $in->{'hardwareId'};
    $encoded->{'protocolVersion'} = 1 * $in->{'protocolVersion'};
    $encoded->{'bootVersion'} = 1 * $in->{'bootVersion'};
    $encoded->{'appVersion'} = 1 * $in->{'appVersion'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'deviceId'} = $in->{'deviceId'};
    $decoded->{'hardwareId'} = $in->{'hardwareId'};
    $decoded->{'protocolVersion'} = $in->{'protocolVersion'};
    $decoded->{'bootVersion'} = $in->{'bootVersion'};
    $decoded->{'appVersion'} = $in->{'appVersion'};
    return $decoded;
}

1;
