# Do NOT edit this file!
# It was generated by IdlC from TimerEventManager.idl.

use strict;

package Raritan::RPC::event::TimerEventManager::Range;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'start'} = 1 * $in->{'start'};
    $encoded->{'end'} = 1 * $in->{'end'};
    $encoded->{'step'} = 1 * $in->{'step'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'start'} = $in->{'start'};
    $decoded->{'end'} = $in->{'end'};
    $decoded->{'step'} = $in->{'step'};
    return $decoded;
}

1;
