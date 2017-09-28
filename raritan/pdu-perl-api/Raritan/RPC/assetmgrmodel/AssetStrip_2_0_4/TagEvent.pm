# Do NOT edit this file!
# It was generated by IdlC from AssetStrip.idl.

use strict;

package Raritan::RPC::assetmgrmodel::AssetStrip_2_0_4::TagEvent;

use constant typeId => "assetmgrmodel.AssetStrip_2_0_4.TagEvent:1.0.0";
use Raritan::RPC::assetmgrmodel::AssetStrip_2_0_4::TagChangeInfo;
use Raritan::RPC::idl::Event;
use Raritan::RPC::assetmgrmodel::AssetStrip_2_0_4::TagInfo;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::idl::Event::encode($in);
    $encoded->{'tags'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'tags'}}; $i0++) {
        $encoded->{'tags'}->[$i0] = Raritan::RPC::assetmgrmodel::AssetStrip_2_0_4::TagChangeInfo::encode($in->{'tags'}->[$i0]);
    }
    $encoded->{'allTags'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'allTags'}}; $i0++) {
        $encoded->{'allTags'}->[$i0] = Raritan::RPC::assetmgrmodel::AssetStrip_2_0_4::TagInfo::encode($in->{'allTags'}->[$i0]);
    }
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::idl::Event::decode($agent, $in);
    $decoded->{'tags'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'tags'}}; $i0++) {
        $decoded->{'tags'}->[$i0] = Raritan::RPC::assetmgrmodel::AssetStrip_2_0_4::TagChangeInfo::decode($agent, $in->{'tags'}->[$i0]);
    }
    $decoded->{'allTags'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'allTags'}}; $i0++) {
        $decoded->{'allTags'}->[$i0] = Raritan::RPC::assetmgrmodel::AssetStrip_2_0_4::TagInfo::decode($agent, $in->{'allTags'}->[$i0]);
    }
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('assetmgrmodel.AssetStrip_2_0_4.TagEvent', 1, 0, 0, 'Raritan::RPC::assetmgrmodel::AssetStrip_2_0_4::TagEvent');
1;
