# Do NOT edit this file!
# It was generated by IdlC from StateSensor.idl.

use strict;

package Raritan::RPC::sensors::StateSensor_2_0_0;

use parent qw(Raritan::RPC::sensors::Sensor_2_0_0);

use constant typeId => "sensors.StateSensor:2.0.0";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::sensors::StateSensor_2_0_0::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}

use Raritan::RPC::sensors::StateSensor_2_0_0::State;

sub getState($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getState', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::sensors::StateSensor_2_0_0::State::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

Raritan::RPC::Registry::registerProxyClass('sensors.StateSensor', 2, 0, 0, 'Raritan::RPC::sensors::StateSensor_2_0_0');
1;
