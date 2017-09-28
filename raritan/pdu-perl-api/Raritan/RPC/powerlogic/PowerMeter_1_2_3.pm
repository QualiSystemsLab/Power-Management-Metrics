# Do NOT edit this file!
# It was generated by IdlC from PowerLogicPowerMeter.idl.

use strict;

package Raritan::RPC::powerlogic::PowerMeter_1_2_3;

use parent qw(Raritan::RPC::modbus::Device);

use constant typeId => "powerlogic.PowerMeter:1.2.3";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::powerlogic::PowerMeter_1_2_3::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}

use Raritan::RPC::powerlogic::PowerMeter_1_2_3::Sensors;

sub getSensors($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getSensors', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::powerlogic::PowerMeter_1_2_3::Sensors::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

use Raritan::RPC::powerlogic::PowerMeter_1_2_3::Setup;

sub getSetup($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getSetup', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::powerlogic::PowerMeter_1_2_3::Setup::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

use Raritan::RPC::powerlogic::PowerMeter_1_2_3::ErrorStatus;

sub getErrorStatus($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getErrorStatus', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::powerlogic::PowerMeter_1_2_3::ErrorStatus::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

sub resetAllMinMaxValues($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'resetAllMinMaxValues', $args);
}

sub clearAllEnergyAccumulators($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'clearAllEnergyAccumulators', $args);
}

Raritan::RPC::Registry::registerProxyClass('powerlogic.PowerMeter', 1, 2, 3, 'Raritan::RPC::powerlogic::PowerMeter_1_2_3');
1;
