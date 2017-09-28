# Do NOT edit this file!
# It was generated by IdlC from Pdu.idl.

use strict;

package Raritan::RPC::pdumodel::Pdu_1_1_1::MetaData;

use Raritan::RPC::pdumodel::Nameplate;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'nameplate'} = Raritan::RPC::pdumodel::Nameplate::encode($in->{'nameplate'});
    $encoded->{'ctrlBoardSerial'} = "$in->{'ctrlBoardSerial'}";
    $encoded->{'hwRevision'} = "$in->{'hwRevision'}";
    $encoded->{'fwRevision'} = "$in->{'fwRevision'}";
    $encoded->{'macAddress'} = "$in->{'macAddress'}";
    $encoded->{'hasSwitchableOutlets'} = ($in->{'hasSwitchableOutlets'}) ? JSON::true : JSON::false;
    $encoded->{'hasMeteredOutlets'} = ($in->{'hasMeteredOutlets'}) ? JSON::true : JSON::false;
    $encoded->{'isInlineMeter'} = ($in->{'isInlineMeter'}) ? JSON::true : JSON::false;
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'nameplate'} = Raritan::RPC::pdumodel::Nameplate::decode($agent, $in->{'nameplate'});
    $decoded->{'ctrlBoardSerial'} = $in->{'ctrlBoardSerial'};
    $decoded->{'hwRevision'} = $in->{'hwRevision'};
    $decoded->{'fwRevision'} = $in->{'fwRevision'};
    $decoded->{'macAddress'} = $in->{'macAddress'};
    $decoded->{'hasSwitchableOutlets'} = ($in->{'hasSwitchableOutlets'}) ? 1 : 0;
    $decoded->{'hasMeteredOutlets'} = ($in->{'hasMeteredOutlets'}) ? 1 : 0;
    $decoded->{'isInlineMeter'} = ($in->{'isInlineMeter'}) ? 1 : 0;
    return $decoded;
}

1;
