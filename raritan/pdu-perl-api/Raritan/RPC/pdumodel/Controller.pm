# Do NOT edit this file!
# It was generated by IdlC from Controller.idl.

use strict;

package Raritan::RPC::pdumodel::Controller;

use parent qw(Raritan::RPC::RemoteObject);

use constant typeId => "pdumodel.Controller:1.0.0";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::pdumodel::Controller::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}

use Raritan::RPC::pdumodel::Controller::MetaData;

sub getMetaData($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getMetaData', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::pdumodel::Controller::MetaData::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

Raritan::RPC::Registry::registerProxyClass('pdumodel.Controller', 1, 0, 0, 'Raritan::RPC::pdumodel::Controller');
1;
