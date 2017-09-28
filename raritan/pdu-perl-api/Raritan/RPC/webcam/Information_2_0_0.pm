# Do NOT edit this file!
# It was generated by IdlC from Webcam.idl.

use strict;

package Raritan::RPC::webcam::Information_2_0_0;

use Raritan::RPC::webcam::Format_2_0_0;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'id'} = "$in->{'id'}";
    $encoded->{'supportedFormats'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'supportedFormats'}}; $i0++) {
        $encoded->{'supportedFormats'}->[$i0] = Raritan::RPC::webcam::Format_2_0_0::encode($in->{'supportedFormats'}->[$i0]);
    }
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'id'} = $in->{'id'};
    $decoded->{'supportedFormats'} = [];
    for (my $i0 = 0; $i0 <= $#{$in->{'supportedFormats'}}; $i0++) {
        $decoded->{'supportedFormats'}->[$i0] = Raritan::RPC::webcam::Format_2_0_0::decode($agent, $in->{'supportedFormats'}->[$i0]);
    }
    return $decoded;
}

1;
