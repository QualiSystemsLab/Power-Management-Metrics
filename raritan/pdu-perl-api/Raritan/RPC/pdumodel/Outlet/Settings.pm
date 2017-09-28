# Do NOT edit this file!
# It was generated by IdlC from Outlet.idl.

use strict;

package Raritan::RPC::pdumodel::Outlet::Settings;


sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'name'} = "$in->{'name'}";
    $encoded->{'startupState'} = $in->{'startupState'};
    $encoded->{'usePduCycleDelay'} = ($in->{'usePduCycleDelay'}) ? JSON::true : JSON::false;
    $encoded->{'cycleDelay'} = 1 * $in->{'cycleDelay'};
    $encoded->{'nonCritical'} = ($in->{'nonCritical'}) ? JSON::true : JSON::false;
    $encoded->{'sequenceDelay'} = 1 * $in->{'sequenceDelay'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'name'} = $in->{'name'};
    $decoded->{'startupState'} = $in->{'startupState'};
    $decoded->{'usePduCycleDelay'} = ($in->{'usePduCycleDelay'}) ? 1 : 0;
    $decoded->{'cycleDelay'} = $in->{'cycleDelay'};
    $decoded->{'nonCritical'} = ($in->{'nonCritical'}) ? 1 : 0;
    $decoded->{'sequenceDelay'} = $in->{'sequenceDelay'};
    return $decoded;
}

1;
