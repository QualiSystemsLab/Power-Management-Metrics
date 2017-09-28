# Do NOT edit this file!
# It was generated by IdlC from PowerLogicPowerMeter.idl.

use strict;

package Raritan::RPC::powerlogic::PowerMeter_1_2_3::SetupChangedEvent;

use constant typeId => "powerlogic.PowerMeter_1_2_3.SetupChangedEvent:1.0.0";
use Raritan::RPC::idl::Event;
use Raritan::RPC::powerlogic::PowerMeter_1_2_3::Setup;
use Raritan::RPC::powerlogic::PowerMeter_1_2_3::Setup;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::idl::Event::encode($in);
    $encoded->{'oldSetup'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::Setup::encode($in->{'oldSetup'});
    $encoded->{'newSetup'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::Setup::encode($in->{'newSetup'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::idl::Event::decode($agent, $in);
    $decoded->{'oldSetup'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::Setup::decode($agent, $in->{'oldSetup'});
    $decoded->{'newSetup'} = Raritan::RPC::powerlogic::PowerMeter_1_2_3::Setup::decode($agent, $in->{'newSetup'});
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('powerlogic.PowerMeter_1_2_3.SetupChangedEvent', 1, 0, 0, 'Raritan::RPC::powerlogic::PowerMeter_1_2_3::SetupChangedEvent');
1;
