# Do NOT edit this file!
# It was generated by IdlC from Port.idl.

use strict;

package Raritan::RPC::portsmodel::Port_2_0_0::Properties;

use Raritan::RPC::portsmodel::Port_2_0_0::DetectionMode;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'name'} = "$in->{'name'}";
    $encoded->{'label'} = "$in->{'label'}";
    $encoded->{'mode'} = Raritan::RPC::portsmodel::Port_2_0_0::DetectionMode::encode($in->{'mode'});
    $encoded->{'detectedDeviceType'} = "$in->{'detectedDeviceType'}";
    $encoded->{'detectedDeviceName'} = "$in->{'detectedDeviceName'}";
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'name'} = $in->{'name'};
    $decoded->{'label'} = $in->{'label'};
    $decoded->{'mode'} = Raritan::RPC::portsmodel::Port_2_0_0::DetectionMode::decode($agent, $in->{'mode'});
    $decoded->{'detectedDeviceType'} = $in->{'detectedDeviceType'};
    $decoded->{'detectedDeviceName'} = $in->{'detectedDeviceName'};
    return $decoded;
}

1;
