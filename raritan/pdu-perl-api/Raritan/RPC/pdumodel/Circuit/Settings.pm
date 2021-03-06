# Do NOT edit this file!
# It was generated by IdlC from Circuit.idl.

use strict;

package Raritan::RPC::pdumodel::Circuit::Settings;

use Raritan::RPC::pdumodel::Circuit::PoleSettings;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'name'} = "$in->{'name'}";
    $encoded->{'rating'} = 1 * $in->{'rating'};
    $encoded->{'ctRating'} = 1 * $in->{'ctRating'};
    $encoded->{'poleSettings'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'poleSettings'}}; $i0++) {
        $encoded->{'poleSettings'}->[$i0] = Raritan::RPC::pdumodel::Circuit::PoleSettings::encode($in->{'poleSettings'}->[$i0]);
    }
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'name'} = $in->{'name'};
    $decoded->{'rating'} = $in->{'rating'};
    $decoded->{'ctRating'} = $in->{'ctRating'};
    $decoded->{'poleSettings'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'poleSettings'}}; $i0++) {
        $decoded->{'poleSettings'}->[$i0] = Raritan::RPC::pdumodel::Circuit::PoleSettings::decode($agent, $in->{'poleSettings'}->[$i0]);
    }
    return $decoded;
}

1;
