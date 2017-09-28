# Do NOT edit this file!
# It was generated by IdlC from SensorLogger.idl.

use strict;

package Raritan::RPC::sensors::Logger_2_1_3::SettingsChangedEvent;

use constant typeId => "sensors.Logger_2_1_3.SettingsChangedEvent:1.0.0";
use Raritan::RPC::sensors::Logger_2_1_3::Settings;
use Raritan::RPC::sensors::Logger_2_1_3::Settings;
use Raritan::RPC::event::UserEvent;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::event::UserEvent::encode($in);
    $encoded->{'oldSettings'} = Raritan::RPC::sensors::Logger_2_1_3::Settings::encode($in->{'oldSettings'});
    $encoded->{'newSettings'} = Raritan::RPC::sensors::Logger_2_1_3::Settings::encode($in->{'newSettings'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::event::UserEvent::decode($agent, $in);
    $decoded->{'oldSettings'} = Raritan::RPC::sensors::Logger_2_1_3::Settings::decode($agent, $in->{'oldSettings'});
    $decoded->{'newSettings'} = Raritan::RPC::sensors::Logger_2_1_3::Settings::decode($agent, $in->{'newSettings'});
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('sensors.Logger_2_1_3.SettingsChangedEvent', 1, 0, 0, 'Raritan::RPC::sensors::Logger_2_1_3::SettingsChangedEvent');
1;
