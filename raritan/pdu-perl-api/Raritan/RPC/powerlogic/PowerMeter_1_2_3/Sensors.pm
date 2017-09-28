# Do NOT edit this file!
# It was generated by IdlC from PowerLogicPowerMeter.idl.

use strict;

package Raritan::RPC::powerlogic::PowerMeter_1_2_3::Sensors;

use Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_plain_total;
use Raritan::RPC::powerlogic::PowerMeter_1_2_3::MinMaxReading;
use Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_plain_total;
use Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_Avg;
use Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_plain_total;
use Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N;
use Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_N_Avg;
use Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2L;
use Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2L_Avg;
use Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'current'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_N_Avg::encode($in->{'current'});
    $encoded->{'voltageL2L'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2L_Avg::encode($in->{'voltageL2L'});
    $encoded->{'voltageL2N'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_Avg::encode($in->{'voltageL2N'});
    $encoded->{'frequency'} = Raritan::RPC::ObjectCodec::encode($in->{'frequency'});
    $encoded->{'activePower'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_plain_total::encode($in->{'activePower'});
    $encoded->{'reactivePower'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_plain_total::encode($in->{'reactivePower'});
    $encoded->{'apparentPower'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_plain_total::encode($in->{'apparentPower'});
    $encoded->{'powerFactor'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::MinMaxReading::encode($in->{'powerFactor'});
    $encoded->{'activeEnergy'} = Raritan::RPC::ObjectCodec::encode($in->{'activeEnergy'});
    $encoded->{'reactiveEnergy'} = Raritan::RPC::ObjectCodec::encode($in->{'reactiveEnergy'});
    $encoded->{'apparentEnergy'} = Raritan::RPC::ObjectCodec::encode($in->{'apparentEnergy'});
    $encoded->{'thdCurrent'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N::encode($in->{'thdCurrent'});
    $encoded->{'thdVoltageL2L'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2L::encode($in->{'thdVoltageL2L'});
    $encoded->{'thdVoltageL2N'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N::encode($in->{'thdVoltageL2N'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'current'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_N_Avg::decode($agent, $in->{'current'});
    $decoded->{'voltageL2L'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2L_Avg::decode($agent, $in->{'voltageL2L'});
    $decoded->{'voltageL2N'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_Avg::decode($agent, $in->{'voltageL2N'});
    $decoded->{'frequency'} = Raritan::RPC::ObjectCodec::decode($agent, $in->{'frequency'}, 'sensors.NumericSensor');
    $decoded->{'activePower'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_plain_total::decode($agent, $in->{'activePower'});
    $decoded->{'reactivePower'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_plain_total::decode($agent, $in->{'reactivePower'});
    $decoded->{'apparentPower'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N_plain_total::decode($agent, $in->{'apparentPower'});
    $decoded->{'powerFactor'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::MinMaxReading::decode($agent, $in->{'powerFactor'});
    $decoded->{'activeEnergy'} = Raritan::RPC::ObjectCodec::decode($agent, $in->{'activeEnergy'}, 'sensors.NumericSensor');
    $decoded->{'reactiveEnergy'} = Raritan::RPC::ObjectCodec::decode($agent, $in->{'reactiveEnergy'}, 'sensors.NumericSensor');
    $decoded->{'apparentEnergy'} = Raritan::RPC::ObjectCodec::decode($agent, $in->{'apparentEnergy'}, 'sensors.NumericSensor');
    $decoded->{'thdCurrent'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N::decode($agent, $in->{'thdCurrent'});
    $decoded->{'thdVoltageL2L'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2L::decode($agent, $in->{'thdVoltageL2L'});
    $decoded->{'thdVoltageL2N'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::L2N::decode($agent, $in->{'thdVoltageL2N'});
    return $decoded;
}

1;
