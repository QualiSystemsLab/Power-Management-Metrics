# Do NOT edit this file!
# It was generated by IdlC from PeripheralDevicePackage.idl.

use strict;

package Raritan::RPC::peripheral::PackageInfo_2_0_0;

use Raritan::RPC::peripheral::PackageInfo_2_0_0::FirmwareInfo;
use Raritan::RPC::peripheral::PosElement;
use Raritan::RPC::peripheral::PackageInfo_2_0_0::HardwareInfo;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'state'} = $in->{'state'};
    $encoded->{'position'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'position'}}; $i0++) {
        $encoded->{'position'}->[$i0] = Raritan::RPC::peripheral::PosElement::encode($in->{'position'}->[$i0]);
    }
    $encoded->{'hwInfo'} = Raritan::RPC::peripheral::PackageInfo_2_0_0::HardwareInfo::encode($in->{'hwInfo'});
    $encoded->{'fwInfo'} = Raritan::RPC::peripheral::PackageInfo_2_0_0::FirmwareInfo::encode($in->{'fwInfo'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'state'} = $in->{'state'};
    $decoded->{'position'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'position'}}; $i0++) {
        $decoded->{'position'}->[$i0] = Raritan::RPC::peripheral::PosElement::decode($agent, $in->{'position'}->[$i0]);
    }
    $decoded->{'hwInfo'} = Raritan::RPC::peripheral::PackageInfo_2_0_0::HardwareInfo::decode($agent, $in->{'hwInfo'});
    $decoded->{'fwInfo'} = Raritan::RPC::peripheral::PackageInfo_2_0_0::FirmwareInfo::decode($agent, $in->{'fwInfo'});
    return $decoded;
}

1;
