# Do NOT edit this file!
# It was generated by IdlC from AssetStripLogger.idl.

use strict;

package Raritan::RPC::assetmgrmodel::AssetStripLogger_1_0_4::Record;


sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'timestamp'} = 1 * $in->{'timestamp'};
    $encoded->{'type'} = $in->{'type'};
    $encoded->{'assetStripNumber'} = 1 * $in->{'assetStripNumber'};
    $encoded->{'rackUnitNumber'} = 1 * $in->{'rackUnitNumber'};
    $encoded->{'rackUnitPosition'} = 1 * $in->{'rackUnitPosition'};
    $encoded->{'slotNumber'} = 1 * $in->{'slotNumber'};
    $encoded->{'tagId'} = "$in->{'tagId'}";
    $encoded->{'parentBladeId'} = "$in->{'parentBladeId'}";
    $encoded->{'state'} = $in->{'state'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'timestamp'} = $in->{'timestamp'};
    $decoded->{'type'} = $in->{'type'};
    $decoded->{'assetStripNumber'} = $in->{'assetStripNumber'};
    $decoded->{'rackUnitNumber'} = $in->{'rackUnitNumber'};
    $decoded->{'rackUnitPosition'} = $in->{'rackUnitPosition'};
    $decoded->{'slotNumber'} = $in->{'slotNumber'};
    $decoded->{'tagId'} = $in->{'tagId'};
    $decoded->{'parentBladeId'} = $in->{'parentBladeId'};
    $decoded->{'state'} = $in->{'state'};
    return $decoded;
}

1;
