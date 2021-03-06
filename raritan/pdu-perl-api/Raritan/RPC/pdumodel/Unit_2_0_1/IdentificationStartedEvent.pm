# Do NOT edit this file!
# It was generated by IdlC from Unit.idl.

use strict;

package Raritan::RPC::pdumodel::Unit_2_0_1::IdentificationStartedEvent;

use constant typeId => "pdumodel.Unit_2_0_1.IdentificationStartedEvent:1.0.0";
use Raritan::RPC::event::UserEvent;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::event::UserEvent::encode($in);
    $encoded->{'duration'} = 1 * $in->{'duration'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::event::UserEvent::decode($agent, $in);
    $decoded->{'duration'} = $in->{'duration'};
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('pdumodel.Unit_2_0_1.IdentificationStartedEvent', 1, 0, 0, 'Raritan::RPC::pdumodel::Unit_2_0_1::IdentificationStartedEvent');
1;
