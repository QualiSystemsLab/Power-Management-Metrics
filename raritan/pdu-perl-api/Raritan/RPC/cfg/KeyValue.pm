# Do NOT edit this file!
# It was generated by IdlC from Cfg.idl.

use strict;

package Raritan::RPC::cfg::KeyValue;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'key'} = "$in->{'key'}";
    $encoded->{'value'} = "$in->{'value'}";
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'key'} = $in->{'key'};
    $decoded->{'value'} = $in->{'value'};
    return $decoded;
}

1;
