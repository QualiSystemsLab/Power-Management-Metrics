# Do NOT edit this file!
# It was generated by IdlC from Outlet.idl.

use strict;

package Raritan::RPC::pdumodel::Outlet_1_5_7::StateChangedEvent;

use constant typeId => "pdumodel.Outlet_1_5_7.StateChangedEvent:1.0.0";
use Raritan::RPC::pdumodel::Outlet_1_5_7::State;
use Raritan::RPC::idl::Event;
use Raritan::RPC::pdumodel::Outlet_1_5_7::State;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::idl::Event::encode($in);
    $encoded->{'oldState'} = Raritan::RPC::pdumodel::Outlet_1_5_7::State::encode($in->{'oldState'});
    $encoded->{'newState'} = Raritan::RPC::pdumodel::Outlet_1_5_7::State::encode($in->{'newState'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::idl::Event::decode($agent, $in);
    $decoded->{'oldState'} = Raritan::RPC::pdumodel::Outlet_1_5_7::State::decode($agent, $in->{'oldState'});
    $decoded->{'newState'} = Raritan::RPC::pdumodel::Outlet_1_5_7::State::decode($agent, $in->{'newState'});
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('pdumodel.Outlet_1_5_7.StateChangedEvent', 1, 0, 0, 'Raritan::RPC::pdumodel::Outlet_1_5_7::StateChangedEvent');
1;
