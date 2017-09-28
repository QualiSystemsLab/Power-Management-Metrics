# Do NOT edit this file!
# It was generated by IdlC from Pdu.idl.

use strict;

package Raritan::RPC::pdumodel::Pdu_4_0_0::OutletSequenceStateChangedEvent;

use constant typeId => "pdumodel.Pdu_4_0_0.OutletSequenceStateChangedEvent:1.0.0";
use Raritan::RPC::pdumodel::Pdu_4_0_0::OutletSequenceState;
use Raritan::RPC::idl::Event;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::idl::Event::encode($in);
    $encoded->{'newState'} = Raritan::RPC::pdumodel::Pdu_4_0_0::OutletSequenceState::encode($in->{'newState'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::idl::Event::decode($agent, $in);
    $decoded->{'newState'} = Raritan::RPC::pdumodel::Pdu_4_0_0::OutletSequenceState::decode($agent, $in->{'newState'});
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('pdumodel.Pdu_4_0_0.OutletSequenceStateChangedEvent', 1, 0, 0, 'Raritan::RPC::pdumodel::Pdu_4_0_0::OutletSequenceStateChangedEvent');
1;
