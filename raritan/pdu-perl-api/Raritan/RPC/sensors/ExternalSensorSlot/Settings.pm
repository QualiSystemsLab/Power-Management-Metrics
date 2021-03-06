# Do NOT edit this file!
# It was generated by IdlC from ExternalSensorSlot.idl.

use strict;

package Raritan::RPC::sensors::ExternalSensorSlot::Settings;

use Raritan::RPC::sensors::ExternalSensorSlot::Location;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'name'} = "$in->{'name'}";
    $encoded->{'description'} = "$in->{'description'}";
    $encoded->{'location'} = Raritan::RPC::sensors::ExternalSensorSlot::Location::encode($in->{'location'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'name'} = $in->{'name'};
    $decoded->{'description'} = $in->{'description'};
    $decoded->{'location'} = Raritan::RPC::sensors::ExternalSensorSlot::Location::decode($agent, $in->{'location'});
    return $decoded;
}

1;
