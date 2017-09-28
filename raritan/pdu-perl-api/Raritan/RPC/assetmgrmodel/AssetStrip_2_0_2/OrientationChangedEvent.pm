# Do NOT edit this file!
# It was generated by IdlC from AssetStrip.idl.

use strict;

package Raritan::RPC::assetmgrmodel::AssetStrip_2_0_2::OrientationChangedEvent;

use constant typeId => "assetmgrmodel.AssetStrip_2_0_2.OrientationChangedEvent:1.0.0";
use Raritan::RPC::idl::Event;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::idl::Event::encode($in);
    $encoded->{'oldOrientation'} = $in->{'oldOrientation'};
    $encoded->{'newOrientation'} = $in->{'newOrientation'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::idl::Event::decode($agent, $in);
    $decoded->{'oldOrientation'} = $in->{'oldOrientation'};
    $decoded->{'newOrientation'} = $in->{'newOrientation'};
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('assetmgrmodel.AssetStrip_2_0_2.OrientationChangedEvent', 1, 0, 0, 'Raritan::RPC::assetmgrmodel::AssetStrip_2_0_2::OrientationChangedEvent');
1;
