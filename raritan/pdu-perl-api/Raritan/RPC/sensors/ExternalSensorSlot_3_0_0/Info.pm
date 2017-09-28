# Do NOT edit this file!
# It was generated by IdlC from ExternalSensorSlot.idl.

use strict;

package Raritan::RPC::sensors::ExternalSensorSlot_3_0_0::Info;

use Raritan::RPC::sensors::ExternalSensorData_3_0_0;
use Raritan::RPC::sensors::ExternalSensorSlot_3_0_0::Settings;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'settings'} = Raritan::RPC::sensors::ExternalSensorSlot_3_0_0::Settings::encode($in->{'settings'});
    $encoded->{'assigned'} = ($in->{'assigned'}) ? JSON::true : JSON::false;
    $encoded->{'data'} = Raritan::RPC::sensors::ExternalSensorData_3_0_0::encode($in->{'data'});
    $encoded->{'numericSensor'} = Raritan::RPC::ObjectCodec::encode($in->{'numericSensor'});
    $encoded->{'stateSensor'} = Raritan::RPC::ObjectCodec::encode($in->{'stateSensor'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'settings'} = Raritan::RPC::sensors::ExternalSensorSlot_3_0_0::Settings::decode($agent, $in->{'settings'});
    $decoded->{'assigned'} = ($in->{'assigned'}) ? 1 : 0;
    $decoded->{'data'} = Raritan::RPC::sensors::ExternalSensorData_3_0_0::decode($agent, $in->{'data'});
    $decoded->{'numericSensor'} = Raritan::RPC::ObjectCodec::decode($agent, $in->{'numericSensor'}, 'sensors.NumericSensor');
    $decoded->{'stateSensor'} = Raritan::RPC::ObjectCodec::decode($agent, $in->{'stateSensor'}, 'sensors.StateSensor');
    return $decoded;
}

1;
