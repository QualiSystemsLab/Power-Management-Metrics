# Do NOT edit this file!
# It was generated by IdlC from Lhx.idl.

use strict;

package Raritan::RPC::lhxmodel::Lhx_3_2_1::AlertStatus;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'sensorFailure'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'sensorFailure'}}; $i0++) {
        $encoded->{'sensorFailure'}->[$i0] = ($in->{'sensorFailure'}->[$i0]) ? JSON::true : JSON::false;
    }
    $encoded->{'fanFailure'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'fanFailure'}}; $i0++) {
        $encoded->{'fanFailure'}->[$i0] = ($in->{'fanFailure'}->[$i0]) ? JSON::true : JSON::false;
    }
    $encoded->{'powerSupplyFailure'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'powerSupplyFailure'}}; $i0++) {
        $encoded->{'powerSupplyFailure'}->[$i0] = ($in->{'powerSupplyFailure'}->[$i0]) ? JSON::true : JSON::false;
    }
    $encoded->{'thresholdAirOutlet'} = ($in->{'thresholdAirOutlet'}) ? JSON::true : JSON::false;
    $encoded->{'thresholdAirInlet'} = ($in->{'thresholdAirInlet'}) ? JSON::true : JSON::false;
    $encoded->{'thresholdWaterInlet'} = ($in->{'thresholdWaterInlet'}) ? JSON::true : JSON::false;
    $encoded->{'doorOpened'} = ($in->{'doorOpened'}) ? JSON::true : JSON::false;
    $encoded->{'maximumCoolingRequest'} = ($in->{'maximumCoolingRequest'}) ? JSON::true : JSON::false;
    $encoded->{'emergencyCooling'} = ($in->{'emergencyCooling'}) ? JSON::true : JSON::false;
    $encoded->{'waterLeak'} = ($in->{'waterLeak'}) ? JSON::true : JSON::false;
    $encoded->{'thresholdHumidity'} = ($in->{'thresholdHumidity'}) ? JSON::true : JSON::false;
    $encoded->{'externalWaterCoolingFailure'} = ($in->{'externalWaterCoolingFailure'}) ? JSON::true : JSON::false;
    $encoded->{'thresholdWaterOutlet'} = ($in->{'thresholdWaterOutlet'}) ? JSON::true : JSON::false;
    $encoded->{'stBusError'} = ($in->{'stBusError'}) ? JSON::true : JSON::false;
    $encoded->{'condenserPumpFailure'} = ($in->{'condenserPumpFailure'}) ? JSON::true : JSON::false;
    $encoded->{'baseElectronicsFailure'} = ($in->{'baseElectronicsFailure'}) ? JSON::true : JSON::false;
    $encoded->{'voltageLow'} = ($in->{'voltageLow'}) ? JSON::true : JSON::false;
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'sensorFailure'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'sensorFailure'}}; $i0++) {
        $decoded->{'sensorFailure'}->[$i0] = ($in->{'sensorFailure'}->[$i0]) ? 1 : 0;
    }
    $decoded->{'fanFailure'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'fanFailure'}}; $i0++) {
        $decoded->{'fanFailure'}->[$i0] = ($in->{'fanFailure'}->[$i0]) ? 1 : 0;
    }
    $decoded->{'powerSupplyFailure'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'powerSupplyFailure'}}; $i0++) {
        $decoded->{'powerSupplyFailure'}->[$i0] = ($in->{'powerSupplyFailure'}->[$i0]) ? 1 : 0;
    }
    $decoded->{'thresholdAirOutlet'} = ($in->{'thresholdAirOutlet'}) ? 1 : 0;
    $decoded->{'thresholdAirInlet'} = ($in->{'thresholdAirInlet'}) ? 1 : 0;
    $decoded->{'thresholdWaterInlet'} = ($in->{'thresholdWaterInlet'}) ? 1 : 0;
    $decoded->{'doorOpened'} = ($in->{'doorOpened'}) ? 1 : 0;
    $decoded->{'maximumCoolingRequest'} = ($in->{'maximumCoolingRequest'}) ? 1 : 0;
    $decoded->{'emergencyCooling'} = ($in->{'emergencyCooling'}) ? 1 : 0;
    $decoded->{'waterLeak'} = ($in->{'waterLeak'}) ? 1 : 0;
    $decoded->{'thresholdHumidity'} = ($in->{'thresholdHumidity'}) ? 1 : 0;
    $decoded->{'externalWaterCoolingFailure'} = ($in->{'externalWaterCoolingFailure'}) ? 1 : 0;
    $decoded->{'thresholdWaterOutlet'} = ($in->{'thresholdWaterOutlet'}) ? 1 : 0;
    $decoded->{'stBusError'} = ($in->{'stBusError'}) ? 1 : 0;
    $decoded->{'condenserPumpFailure'} = ($in->{'condenserPumpFailure'}) ? 1 : 0;
    $decoded->{'baseElectronicsFailure'} = ($in->{'baseElectronicsFailure'}) ? 1 : 0;
    $decoded->{'voltageLow'} = ($in->{'voltageLow'}) ? 1 : 0;
    return $decoded;
}

1;
