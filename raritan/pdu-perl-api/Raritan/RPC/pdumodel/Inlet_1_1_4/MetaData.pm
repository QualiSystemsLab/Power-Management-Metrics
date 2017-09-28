# Do NOT edit this file!
# It was generated by IdlC from Inlet.idl.

use strict;

package Raritan::RPC::pdumodel::Inlet_1_1_4::MetaData;

use Raritan::RPC::pdumodel::Rating;
use Raritan::RPC::pdumodel::Nameplate;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'label'} = "$in->{'label'}";
    $encoded->{'plugType'} = "$in->{'plugType'}";
    $encoded->{'namePlate'} = Raritan::RPC::pdumodel::Nameplate::encode($in->{'namePlate'});
    $encoded->{'rating'} = Raritan::RPC::pdumodel::Rating::encode($in->{'rating'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'label'} = $in->{'label'};
    $decoded->{'plugType'} = $in->{'plugType'};
    $decoded->{'namePlate'} = Raritan::RPC::pdumodel::Nameplate::decode($agent, $in->{'namePlate'});
    $decoded->{'rating'} = Raritan::RPC::pdumodel::Rating::decode($agent, $in->{'rating'});
    return $decoded;
}

1;
