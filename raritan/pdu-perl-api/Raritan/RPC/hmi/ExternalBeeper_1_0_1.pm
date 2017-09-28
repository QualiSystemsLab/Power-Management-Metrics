# Do NOT edit this file!
# It was generated by IdlC from ExternalBeeper.idl.

use strict;

package Raritan::RPC::hmi::ExternalBeeper_1_0_1;

use parent qw(Raritan::RPC::RemoteObject);

use constant typeId => "hmi.ExternalBeeper:1.0.1";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::hmi::ExternalBeeper_1_0_1::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}


sub getState($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getState', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

sub alarm($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'alarm', $args);
}

sub on($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'on', $args);
}

sub off($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'off', $args);
}

Raritan::RPC::Registry::registerProxyClass('hmi.ExternalBeeper', 1, 0, 1, 'Raritan::RPC::hmi::ExternalBeeper_1_0_1');
1;