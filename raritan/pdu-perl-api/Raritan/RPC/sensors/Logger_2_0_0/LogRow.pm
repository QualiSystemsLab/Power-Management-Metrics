# Do NOT edit this file!
# It was generated by IdlC from SensorLogger.idl.

use strict;

package Raritan::RPC::sensors::Logger_2_0_0::LogRow;

use Raritan::RPC::sensors::Logger_2_0_0::Record;
use Raritan::RPC::sensors::Logger_2_0_0::Record;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'sensorSetTimestamp'} = 1 * $in->{'sensorSetTimestamp'};
    $encoded->{'timestamp'} = 1 * $in->{'timestamp'};
    $encoded->{'sensorRecords'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'sensorRecords'}}; $i0++) {
        $encoded->{'sensorRecords'}->[$i0] = Raritan::RPC::sensors::Logger_2_0_0::Record::encode($in->{'sensorRecords'}->[$i0]);
    }
    $encoded->{'peripheralDeviceRecords'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'peripheralDeviceRecords'}}; $i0++) {
        $encoded->{'peripheralDeviceRecords'}->[$i0] = Raritan::RPC::sensors::Logger_2_0_0::Record::encode($in->{'peripheralDeviceRecords'}->[$i0]);
    }
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'sensorSetTimestamp'} = $in->{'sensorSetTimestamp'};
    $decoded->{'timestamp'} = $in->{'timestamp'};
    $decoded->{'sensorRecords'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'sensorRecords'}}; $i0++) {
        $decoded->{'sensorRecords'}->[$i0] = Raritan::RPC::sensors::Logger_2_0_0::Record::decode($agent, $in->{'sensorRecords'}->[$i0]);
    }
    $decoded->{'peripheralDeviceRecords'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'peripheralDeviceRecords'}}; $i0++) {
        $decoded->{'peripheralDeviceRecords'}->[$i0] = Raritan::RPC::sensors::Logger_2_0_0::Record::decode($agent, $in->{'peripheralDeviceRecords'}->[$i0]);
    }
    return $decoded;
}

1;
