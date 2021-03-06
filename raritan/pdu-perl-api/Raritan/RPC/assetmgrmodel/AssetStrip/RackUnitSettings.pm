# Do NOT edit this file!
# It was generated by IdlC from AssetStrip.idl.

use strict;

package Raritan::RPC::assetmgrmodel::AssetStrip::RackUnitSettings;

use Raritan::RPC::assetmgrmodel::AssetStrip::LEDColor;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'opmode'} = $in->{'opmode'};
    $encoded->{'mode'} = $in->{'mode'};
    $encoded->{'color'} = Raritan::RPC::assetmgrmodel::AssetStrip::LEDColor::encode($in->{'color'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'opmode'} = $in->{'opmode'};
    $decoded->{'mode'} = $in->{'mode'};
    $decoded->{'color'} = Raritan::RPC::assetmgrmodel::AssetStrip::LEDColor::decode($agent, $in->{'color'});
    return $decoded;
}

1;
