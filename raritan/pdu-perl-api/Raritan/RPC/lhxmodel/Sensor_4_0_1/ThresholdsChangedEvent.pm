# Do NOT edit this file!
# It was generated by IdlC from LhxSensor.idl.

use strict;

package Raritan::RPC::lhxmodel::Sensor_4_0_1::ThresholdsChangedEvent;

use constant typeId => "lhxmodel.Sensor_4_0_1.ThresholdsChangedEvent:1.0.0";
use Raritan::RPC::event::UserEvent;
use Raritan::RPC::lhxmodel::Sensor_4_0_1::NumThresholds;
use Raritan::RPC::lhxmodel::Sensor_4_0_1::NumThresholds;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::event::UserEvent::encode($in);
    $encoded->{'oldThresholds'} = Raritan::RPC::lhxmodel::Sensor_4_0_1::NumThresholds::encode($in->{'oldThresholds'});
    $encoded->{'newThresholds'} = Raritan::RPC::lhxmodel::Sensor_4_0_1::NumThresholds::encode($in->{'newThresholds'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::event::UserEvent::decode($agent, $in);
    $decoded->{'oldThresholds'} = Raritan::RPC::lhxmodel::Sensor_4_0_1::NumThresholds::decode($agent, $in->{'oldThresholds'});
    $decoded->{'newThresholds'} = Raritan::RPC::lhxmodel::Sensor_4_0_1::NumThresholds::decode($agent, $in->{'newThresholds'});
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('lhxmodel.Sensor_4_0_1.ThresholdsChangedEvent', 1, 0, 0, 'Raritan::RPC::lhxmodel::Sensor_4_0_1::ThresholdsChangedEvent');
1;
