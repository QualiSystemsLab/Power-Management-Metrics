# Do NOT edit this file!
# It was generated by IdlC from Wire.idl.

use strict;

package Raritan::RPC::pdumodel::Wire_1_0_1::MetaData;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'label'} = "$in->{'label'}";
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'label'} = $in->{'label'};
    return $decoded;
}

1;
