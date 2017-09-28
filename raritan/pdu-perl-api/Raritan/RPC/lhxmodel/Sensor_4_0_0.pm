# Do NOT edit this file!
# It was generated by IdlC from LhxSensor.idl.

use strict;

package Raritan::RPC::lhxmodel::Sensor_4_0_0;

use parent qw(Raritan::RPC::sensors::Sensor_4_0_0);

use constant typeId => "lhxmodel.Sensor:4.0.0";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::lhxmodel::Sensor_4_0_0::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}

use constant STATE_NOT_AVAILABLE => -1;

use constant STATE_CLOSED => 0;

use constant STATE_OPEN => 1;

use constant STATE_NUM_NORMAL => 0;

use constant STATE_NUM_ABOVE_UPPER_CRITICAL => 1;

use constant STATE_NUM_ABOVE_UPPER_WARNING => 2;

use constant STATE_NUM_BELOW_LOWER_WARNING => 3;

use constant STATE_NUM_BELOW_LOWER_CRITICAL => 4;

use constant ERR_INVALID_PARAM => 1;

use constant ERR_NOT_SUPPORTED => 2;

use Raritan::RPC::lhxmodel::Sensor_4_0_0::MetaData;

sub getMetaData($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getMetaData', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::lhxmodel::Sensor_4_0_0::MetaData::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

use Raritan::RPC::lhxmodel::Sensor_4_0_0::NumThresholds;

sub getThresholds($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getThresholds', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::lhxmodel::Sensor_4_0_0::NumThresholds::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

use Raritan::RPC::lhxmodel::Sensor_4_0_0::NumThresholds;

sub setThresholds($$) {
    my ($self, $thresholds) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'thresholds'} = Raritan::RPC::lhxmodel::Sensor_4_0_0::NumThresholds::encode($thresholds);
    my $rsp = $agent->json_rpc($self->{'rid'}, 'setThresholds', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

use Raritan::RPC::lhxmodel::Sensor_4_0_0::Reading;

sub getReading($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getReading', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::lhxmodel::Sensor_4_0_0::Reading::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

Raritan::RPC::Registry::registerProxyClass('lhxmodel.Sensor', 4, 0, 0, 'Raritan::RPC::lhxmodel::Sensor_4_0_0');
1;
