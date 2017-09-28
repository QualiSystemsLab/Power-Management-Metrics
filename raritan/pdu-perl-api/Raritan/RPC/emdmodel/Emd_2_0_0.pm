# Do NOT edit this file!
# It was generated by IdlC from Emd.idl.

use strict;

package Raritan::RPC::emdmodel::Emd_2_0_0;

use parent qw(Raritan::RPC::RemoteObject);

use constant typeId => "emdmodel.Emd:2.0.0";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::emdmodel::Emd_2_0_0::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}

use constant ERR_INVALID_PARAMS => 1;

use Raritan::RPC::emdmodel::Emd_2_0_0::MetaData;

sub getMetaData($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getMetaData', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::emdmodel::Emd_2_0_0::MetaData::decode($agent, $rsp->{'_ret_'});
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

use Raritan::RPC::emdmodel::Emd_2_0_0::Settings;

sub getSettings($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getSettings', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::emdmodel::Emd_2_0_0::Settings::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

use Raritan::RPC::emdmodel::Emd_2_0_0::Settings;

sub setSettings($$) {
    my ($self, $settings) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'settings'} = Raritan::RPC::emdmodel::Emd_2_0_0::Settings::encode($settings);
    my $rsp = $agent->json_rpc($self->{'rid'}, 'setSettings', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
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


sub getAuxiliaryPorts($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getAuxiliaryPorts', $args);
    my $_ret_;
    $_ret_ = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'_ret_'}}; $i0++) {
        $_ret_->[$i0] = Raritan::RPC::ObjectCodec::decode($agent, $rsp->{'_ret_'}->[$i0], 'portsmodel.Port');
    }
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

Raritan::RPC::Registry::registerProxyClass('emdmodel.Emd', 2, 0, 0, 'Raritan::RPC::emdmodel::Emd_2_0_0');
1;
