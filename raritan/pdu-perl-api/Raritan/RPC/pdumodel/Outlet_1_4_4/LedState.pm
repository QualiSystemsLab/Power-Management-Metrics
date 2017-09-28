# Do NOT edit this file!
# It was generated by IdlC from Outlet.idl.

use strict;

package Raritan::RPC::pdumodel::Outlet_1_4_4::LedState;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'red'} = ($in->{'red'}) ? JSON::true : JSON::false;
    $encoded->{'green'} = ($in->{'green'}) ? JSON::true : JSON::false;
    $encoded->{'blinking'} = ($in->{'blinking'}) ? JSON::true : JSON::false;
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'red'} = ($in->{'red'}) ? 1 : 0;
    $decoded->{'green'} = ($in->{'green'}) ? 1 : 0;
    $decoded->{'blinking'} = ($in->{'blinking'}) ? 1 : 0;
    return $decoded;
}

1;
