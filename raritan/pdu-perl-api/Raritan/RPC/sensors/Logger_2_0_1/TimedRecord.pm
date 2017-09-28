# Do NOT edit this file!
# It was generated by IdlC from SensorLogger.idl.

use strict;

package Raritan::RPC::sensors::Logger_2_0_1::TimedRecord;

use Raritan::RPC::sensors::Logger_2_0_1::Record;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'timestamp'} = 1 * $in->{'timestamp'};
    $encoded->{'record'} = Raritan::RPC::sensors::Logger_2_0_1::Record::encode($in->{'record'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'timestamp'} = $in->{'timestamp'};
    $decoded->{'record'} = Raritan::RPC::sensors::Logger_2_0_1::Record::decode($agent, $in->{'record'});
    return $decoded;
}

1;
