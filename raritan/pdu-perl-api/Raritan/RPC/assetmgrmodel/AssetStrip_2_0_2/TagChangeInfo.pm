# Do NOT edit this file!
# It was generated by IdlC from AssetStrip.idl.

use strict;

package Raritan::RPC::assetmgrmodel::AssetStrip_2_0_2::TagChangeInfo;

use Raritan::RPC::assetmgrmodel::AssetStrip_2_0_2::TagInfo;
use Raritan::RPC::assetmgrmodel::AssetStrip_2_0_2::RackUnitInfo;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'tag'} = Raritan::RPC::assetmgrmodel::AssetStrip_2_0_2::TagInfo::encode($in->{'tag'});
    $encoded->{'info'} = Raritan::RPC::assetmgrmodel::AssetStrip_2_0_2::RackUnitInfo::encode($in->{'info'});
    $encoded->{'parentBladeTagId'} = "$in->{'parentBladeTagId'}";
    $encoded->{'slotPosition'} = 1 * $in->{'slotPosition'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'tag'} = Raritan::RPC::assetmgrmodel::AssetStrip_2_0_2::TagInfo::decode($agent, $in->{'tag'});
    $decoded->{'info'} = Raritan::RPC::assetmgrmodel::AssetStrip_2_0_2::RackUnitInfo::decode($agent, $in->{'info'});
    $decoded->{'parentBladeTagId'} = $in->{'parentBladeTagId'};
    $decoded->{'slotPosition'} = $in->{'slotPosition'};
    return $decoded;
}

1;
