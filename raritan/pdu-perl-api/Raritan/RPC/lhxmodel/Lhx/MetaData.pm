# Do NOT edit this file!
# It was generated by IdlC from Lhx.idl.

use strict;

package Raritan::RPC::lhxmodel::Lhx::MetaData;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'model'} = "$in->{'model'}";
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'model'} = $in->{'model'};
    return $decoded;
}

1;
