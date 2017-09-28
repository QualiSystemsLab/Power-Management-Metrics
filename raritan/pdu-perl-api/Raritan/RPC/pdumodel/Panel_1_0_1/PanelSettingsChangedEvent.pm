# Do NOT edit this file!
# It was generated by IdlC from Panel.idl.

use strict;

package Raritan::RPC::pdumodel::Panel_1_0_1::PanelSettingsChangedEvent;

use constant typeId => "pdumodel.Panel_1_0_1.PanelSettingsChangedEvent:1.0.0";
use Raritan::RPC::pdumodel::Panel_1_0_1::PanelSettings;
use Raritan::RPC::pdumodel::Panel_1_0_1::PanelSettings;
use Raritan::RPC::event::UserEvent;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::event::UserEvent::encode($in);
    $encoded->{'oldSettings'} = Raritan::RPC::pdumodel::Panel_1_0_1::PanelSettings::encode($in->{'oldSettings'});
    $encoded->{'newSettings'} = Raritan::RPC::pdumodel::Panel_1_0_1::PanelSettings::encode($in->{'newSettings'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::event::UserEvent::decode($agent, $in);
    $decoded->{'oldSettings'} = Raritan::RPC::pdumodel::Panel_1_0_1::PanelSettings::decode($agent, $in->{'oldSettings'});
    $decoded->{'newSettings'} = Raritan::RPC::pdumodel::Panel_1_0_1::PanelSettings::decode($agent, $in->{'newSettings'});
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('pdumodel.Panel_1_0_1.PanelSettingsChangedEvent', 1, 0, 0, 'Raritan::RPC::pdumodel::Panel_1_0_1::PanelSettingsChangedEvent');
1;
