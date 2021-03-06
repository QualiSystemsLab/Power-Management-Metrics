# Do NOT edit this file!
# It was generated by IdlC from Pdu.idl.

use strict;

package Raritan::RPC::pdumodel::Pdu_2_0_0;

use parent qw(Raritan::RPC::RemoteObject);

use constant typeId => "pdumodel.Pdu:2.0.0";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::pdumodel::Pdu_2_0_0::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}

use Raritan::RPC::pdumodel::Nameplate;

sub getNameplate($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getNameplate', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::pdumodel::Nameplate::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

use Raritan::RPC::pdumodel::Pdu_2_0_0::MetaData;

sub getMetaData($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getMetaData', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::pdumodel::Pdu_2_0_0::MetaData::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}


sub getSensorLogger($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getSensorLogger', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::ObjectCodec::decode($agent, $rsp->{'_ret_'}, 'sensors.Logger');
    return $_ret_;
}


sub getControllers($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getControllers', $args);
    my $_ret_;
    $_ret_ = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'_ret_'}}; $i0++) {
        $_ret_->[$i0] = Raritan::RPC::ObjectCodec::decode($agent, $rsp->{'_ret_'}->[$i0], 'pdumodel.Controller');
    }
    return $_ret_;
}


sub getOutlets($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getOutlets', $args);
    my $_ret_;
    $_ret_ = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'_ret_'}}; $i0++) {
        $_ret_->[$i0] = Raritan::RPC::ObjectCodec::decode($agent, $rsp->{'_ret_'}->[$i0], 'pdumodel.Outlet');
    }
    return $_ret_;
}


sub getOverCurrentProtectors($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getOverCurrentProtectors', $args);
    my $_ret_;
    $_ret_ = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'_ret_'}}; $i0++) {
        $_ret_->[$i0] = Raritan::RPC::ObjectCodec::decode($agent, $rsp->{'_ret_'}->[$i0], 'pdumodel.OverCurrentProtector');
    }
    return $_ret_;
}


sub getInlets($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getInlets', $args);
    my $_ret_;
    $_ret_ = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'_ret_'}}; $i0++) {
        $_ret_->[$i0] = Raritan::RPC::ObjectCodec::decode($agent, $rsp->{'_ret_'}->[$i0], 'pdumodel.Inlet');
    }
    return $_ret_;
}


sub getWires($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getWires', $args);
    my $_ret_;
    $_ret_ = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'_ret_'}}; $i0++) {
        $_ret_->[$i0] = Raritan::RPC::ObjectCodec::decode($agent, $rsp->{'_ret_'}->[$i0], 'pdumodel.Wire');
    }
    return $_ret_;
}


sub getTransferSwitches($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getTransferSwitches', $args);
    my $_ret_;
    $_ret_ = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'_ret_'}}; $i0++) {
        $_ret_->[$i0] = Raritan::RPC::ObjectCodec::decode($agent, $rsp->{'_ret_'}->[$i0], 'pdumodel.TransferSwitch');
    }
    return $_ret_;
}


sub getPeripheralDeviceManager($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getPeripheralDeviceManager', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::ObjectCodec::decode($agent, $rsp->{'_ret_'}, 'peripheral.DeviceManager');
    return $_ret_;
}

use Raritan::RPC::pdumodel::Pdu_2_0_0::Settings;

sub getSettings($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getSettings', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::pdumodel::Pdu_2_0_0::Settings::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

sub isLoadSheddingActive($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'isLoadSheddingActive', $args);
    my $_ret_;
    $_ret_ = ($rsp->{'_ret_'}) ? 1 : 0;
    return $_ret_;
}

use Raritan::RPC::pdumodel::Pdu_2_0_0::Settings;

sub setSettings($$) {
    my ($self, $settings) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'settings'} = Raritan::RPC::pdumodel::Pdu_2_0_0::Settings::encode($settings);
    my $rsp = $agent->json_rpc($self->{'rid'}, 'setSettings', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

sub setLoadSheddingActive($$) {
    my ($self, $active) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'active'} = ($active) ? JSON::true : JSON::false;
    my $rsp = $agent->json_rpc($self->{'rid'}, 'setLoadSheddingActive', $args);
}


sub getFeaturePorts($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getFeaturePorts', $args);
    my $_ret_;
    $_ret_ = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'_ret_'}}; $i0++) {
        $_ret_->[$i0] = Raritan::RPC::ObjectCodec::decode($agent, $rsp->{'_ret_'}->[$i0], 'portsmodel.Port');
    }
    return $_ret_;
}

sub enterRS485ConfigModeAndAssignCtrlBoardAddress($$) {
    my ($self, $addr) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'addr'} = 1 * $addr;
    my $rsp = $agent->json_rpc($self->{'rid'}, 'enterRS485ConfigModeAndAssignCtrlBoardAddress', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

sub enterRS485ConfigModeAndAssignSCBoardAddress($$$) {
    my ($self, $deviceId, $addr) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'deviceId'} = 1 * $deviceId;
    $args->{'addr'} = 1 * $addr;
    my $rsp = $agent->json_rpc($self->{'rid'}, 'enterRS485ConfigModeAndAssignSCBoardAddress', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

sub leaveRS485ConfigMode($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'leaveRS485ConfigMode', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}


sub setAllOutletPowerStates($$) {
    my ($self, $pstate) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'pstate'} = $pstate;
    my $rsp = $agent->json_rpc($self->{'rid'}, 'setAllOutletPowerStates', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}


sub setMultipleOutletPowerStates($$$$) {
    my ($self, $outletNumbers, $state, $respectSequence) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'outletNumbers'} = [];
    for (my $i0 = 0; $i0 <= $#{$outletNumbers}; $i0++) {
        $args->{'outletNumbers'}->[$i0] = 1 * $outletNumbers->[$i0];
    }
    $args->{'state'} = $state;
    $args->{'respectSequence'} = ($respectSequence) ? JSON::true : JSON::false;
    my $rsp = $agent->json_rpc($self->{'rid'}, 'setMultipleOutletPowerStates', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

sub cycleAllOutletPowerStates($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'cycleAllOutletPowerStates', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

sub cycleMultipleOutletPowerStates($$$) {
    my ($self, $outletNumbers, $respectSequence) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'outletNumbers'} = [];
    for (my $i0 = 0; $i0 <= $#{$outletNumbers}; $i0++) {
        $args->{'outletNumbers'}->[$i0] = 1 * $outletNumbers->[$i0];
    }
    $args->{'respectSequence'} = ($respectSequence) ? JSON::true : JSON::false;
    my $rsp = $agent->json_rpc($self->{'rid'}, 'cycleMultipleOutletPowerStates', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

use Raritan::RPC::pdumodel::Pdu_2_0_0::Statistic;

sub getStatistic($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getStatistic', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::pdumodel::Pdu_2_0_0::Statistic::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

use Raritan::RPC::pdumodel::Pdu_2_0_0::OutletSequenceState;

sub getOutletSequenceState($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getOutletSequenceState', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::pdumodel::Pdu_2_0_0::OutletSequenceState::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

sub cancelOutletSequence($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'cancelOutletSequence', $args);
}

Raritan::RPC::Registry::registerProxyClass('pdumodel.Pdu', 2, 0, 0, 'Raritan::RPC::pdumodel::Pdu_2_0_0');
1;
