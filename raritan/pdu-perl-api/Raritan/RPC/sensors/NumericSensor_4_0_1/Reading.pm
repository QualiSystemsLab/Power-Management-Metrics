# Do NOT edit this file!
# It was generated by IdlC from NumericSensor.idl.

use strict;

package Raritan::RPC::sensors::NumericSensor_4_0_1::Reading;

use Raritan::RPC::sensors::NumericSensor_4_0_1::Reading::Status;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'timestamp'} = 1 * $in->{'timestamp'};
    $encoded->{'available'} = ($in->{'available'}) ? JSON::true : JSON::false;
    $encoded->{'status'} = Raritan::RPC::sensors::NumericSensor_4_0_1::Reading::Status::encode($in->{'status'});
    $encoded->{'valid'} = ($in->{'valid'}) ? JSON::true : JSON::false;
    $encoded->{'value'} = 1 * $in->{'value'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'timestamp'} = $in->{'timestamp'};
    $decoded->{'available'} = ($in->{'available'}) ? 1 : 0;
    $decoded->{'status'} = Raritan::RPC::sensors::NumericSensor_4_0_1::Reading::Status::decode($agent, $in->{'status'});
    $decoded->{'valid'} = ($in->{'valid'}) ? 1 : 0;
    $decoded->{'value'} = $in->{'value'};
    return $decoded;
}

1;
