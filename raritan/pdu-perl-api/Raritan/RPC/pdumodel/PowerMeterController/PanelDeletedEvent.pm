# Do NOT edit this file!
# It was generated by IdlC from PowerMeterController.idl.

use strict;

package Raritan::RPC::pdumodel::PowerMeterController::PanelDeletedEvent;

use constant typeId => "pdumodel.PowerMeterController.PanelDeletedEvent:1.0.0";
use Raritan::RPC::pdumodel::PowerMeterController::PowerMeterDeletedEvent;
use Raritan::RPC::pdumodel::Panel::PanelSettings;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::pdumodel::PowerMeterController::PowerMeterDeletedEvent::encode($in);
    $encoded->{'panelSettings'} = Raritan::RPC::pdumodel::Panel::PanelSettings::encode($in->{'panelSettings'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::pdumodel::PowerMeterController::PowerMeterDeletedEvent::decode($agent, $in);
    $decoded->{'panelSettings'} = Raritan::RPC::pdumodel::Panel::PanelSettings::decode($agent, $in->{'panelSettings'});
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('pdumodel.PowerMeterController.PanelDeletedEvent', 1, 0, 0, 'Raritan::RPC::pdumodel::PowerMeterController::PanelDeletedEvent');
1;
