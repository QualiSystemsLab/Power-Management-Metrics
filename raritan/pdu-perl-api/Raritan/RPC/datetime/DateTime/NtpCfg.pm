# Do NOT edit this file!
# It was generated by IdlC from DateTime.idl.

use strict;

package Raritan::RPC::datetime::DateTime::NtpCfg;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'forceStatic'} = ($in->{'forceStatic'}) ? JSON::true : JSON::false;
    $encoded->{'server1'} = "$in->{'server1'}";
    $encoded->{'server2'} = "$in->{'server2'}";
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'forceStatic'} = ($in->{'forceStatic'}) ? 1 : 0;
    $decoded->{'server1'} = $in->{'server1'};
    $decoded->{'server2'} = $in->{'server2'};
    return $decoded;
}

1;
