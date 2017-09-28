# Do NOT edit this file!
# It was generated by IdlC from MemoryMapController.idl.

use strict;

package Raritan::RPC::pdumodel::MemoryMapController_3_0_0;

use parent qw(Raritan::RPC::pdumodel::Controller_3_0_0);

use constant typeId => "pdumodel.MemoryMapController:3.0.0";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::pdumodel::MemoryMapController_3_0_0::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}

sub readMemory($$$$) {
    my ($self, $address, $size, $memory) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'address'} = 1 * $address;
    $args->{'size'} = 1 * $size;
    my $rsp = $agent->json_rpc($self->{'rid'}, 'readMemory', $args);
    $$memory = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'memory'}}; $i0++) {
        $$memory->[$i0] = $rsp->{'memory'}->[$i0];
    }
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

sub writeMemory($$$) {
    my ($self, $address, $memory) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'address'} = 1 * $address;
    $args->{'memory'} = [];
    for (my $i0 = 0; $i0 <= $#{$memory}; $i0++) {
        $args->{'memory'}->[$i0] = 1 * $memory->[$i0];
    }
    my $rsp = $agent->json_rpc($self->{'rid'}, 'writeMemory', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

Raritan::RPC::Registry::registerProxyClass('pdumodel.MemoryMapController', 3, 0, 0, 'Raritan::RPC::pdumodel::MemoryMapController_3_0_0');
1;
