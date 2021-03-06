# Do NOT edit this file!
# It was generated by IdlC from PowerMeter.idl.

use strict;

package Raritan::RPC::pdumodel::PowerMeter_1_0_1::Config;


sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'powerMeterId'} = 1 * $in->{'powerMeterId'};
    $encoded->{'type'} = $in->{'type'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'powerMeterId'} = $in->{'powerMeterId'};
    $decoded->{'type'} = $in->{'type'};
    return $decoded;
}

1;
