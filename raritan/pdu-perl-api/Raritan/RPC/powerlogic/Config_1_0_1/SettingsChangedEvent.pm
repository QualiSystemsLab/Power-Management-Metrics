# Do NOT edit this file!
# It was generated by IdlC from PowerLogicConfig.idl.

use strict;

package Raritan::RPC::powerlogic::Config_1_0_1::SettingsChangedEvent;

use constant typeId => "powerlogic.Config_1_0_1.SettingsChangedEvent:1.0.0";
use Raritan::RPC::event::UserEvent;
use Raritan::RPC::powerlogic::Config_1_0_1::Settings;
use Raritan::RPC::powerlogic::Config_1_0_1::Settings;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::event::UserEvent::encode($in);
    $encoded->{'oldSettings'} = Raritan::RPC::powerlogic::Config_1_0_1::Settings::encode($in->{'oldSettings'});
    $encoded->{'newSettings'} = Raritan::RPC::powerlogic::Config_1_0_1::Settings::encode($in->{'newSettings'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::event::UserEvent::decode($agent, $in);
    $decoded->{'oldSettings'} = Raritan::RPC::powerlogic::Config_1_0_1::Settings::decode($agent, $in->{'oldSettings'});
    $decoded->{'newSettings'} = Raritan::RPC::powerlogic::Config_1_0_1::Settings::decode($agent, $in->{'newSettings'});
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('powerlogic.Config_1_0_1.SettingsChangedEvent', 1, 0, 0, 'Raritan::RPC::powerlogic::Config_1_0_1::SettingsChangedEvent');
1;
