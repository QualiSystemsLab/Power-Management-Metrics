# Do NOT edit this file!
# It was generated by IdlC from Inlet.idl.

use strict;

package Raritan::RPC::pdumodel::Inlet_2_0_0::EnableStateChangedEvent;

use constant typeId => "pdumodel.Inlet_2_0_0.EnableStateChangedEvent:1.0.0";
use Raritan::RPC::event::UserEvent;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::event::UserEvent::encode($in);
    $encoded->{'enabled'} = ($in->{'enabled'}) ? JSON::true : JSON::false;
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::event::UserEvent::decode($agent, $in);
    $decoded->{'enabled'} = ($in->{'enabled'}) ? 1 : 0;
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('pdumodel.Inlet_2_0_0.EnableStateChangedEvent', 1, 0, 0, 'Raritan::RPC::pdumodel::Inlet_2_0_0::EnableStateChangedEvent');
1;
