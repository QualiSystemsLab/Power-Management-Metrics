# Do NOT edit this file!
# It was generated by IdlC from AssetStripConfig.idl.

use strict;

package Raritan::RPC::assetmgrmodel::AssetStripConfig_1_0_1::StripSettingsChangedEvent;

use constant typeId => "assetmgrmodel.AssetStripConfig_1_0_1.StripSettingsChangedEvent:1.0.0";
use Raritan::RPC::event::UserEvent;
use Raritan::RPC::assetmgrmodel::AssetStripConfig_1_0_1::StripSettings;
use Raritan::RPC::assetmgrmodel::AssetStripConfig_1_0_1::StripSettings;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::event::UserEvent::encode($in);
    $encoded->{'oldSettings'} = Raritan::RPC::assetmgrmodel::AssetStripConfig_1_0_1::StripSettings::encode($in->{'oldSettings'});
    $encoded->{'newSettings'} = Raritan::RPC::assetmgrmodel::AssetStripConfig_1_0_1::StripSettings::encode($in->{'newSettings'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::event::UserEvent::decode($agent, $in);
    $decoded->{'oldSettings'} = Raritan::RPC::assetmgrmodel::AssetStripConfig_1_0_1::StripSettings::decode($agent, $in->{'oldSettings'});
    $decoded->{'newSettings'} = Raritan::RPC::assetmgrmodel::AssetStripConfig_1_0_1::StripSettings::decode($agent, $in->{'newSettings'});
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('assetmgrmodel.AssetStripConfig_1_0_1.StripSettingsChangedEvent', 1, 0, 0, 'Raritan::RPC::assetmgrmodel::AssetStripConfig_1_0_1::StripSettingsChangedEvent');
1;
