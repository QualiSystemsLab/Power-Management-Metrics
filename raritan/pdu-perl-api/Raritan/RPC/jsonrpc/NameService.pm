# Do NOT edit this file!
# It was generated by IdlC from NameService.idl.

use strict;

package Raritan::RPC::jsonrpc::NameService;

use parent qw(Raritan::RPC::RemoteObject);

use constant typeId => "jsonrpc.NameService:1.0.0";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::jsonrpc::NameService::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}

sub lookup($$) {
    my ($self, $name) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'name'} = "$name";
    my $rsp = $agent->json_rpc($self->{'rid'}, 'lookup', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::ObjectCodec::decode($agent, $rsp->{'_ret_'}, 'idl.Object');
    return $_ret_;
}

Raritan::RPC::Registry::registerProxyClass('jsonrpc.NameService', 1, 0, 0, 'Raritan::RPC::jsonrpc::NameService');
1;
