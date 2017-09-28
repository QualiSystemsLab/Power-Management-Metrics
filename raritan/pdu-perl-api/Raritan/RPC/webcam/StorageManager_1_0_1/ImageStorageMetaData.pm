# Do NOT edit this file!
# It was generated by IdlC from StorageManager.idl.

use strict;

package Raritan::RPC::webcam::StorageManager_1_0_1::ImageStorageMetaData;

use Raritan::RPC::webcam::ImageMetaData;
use Raritan::RPC::webcam::StorageManager_1_0_1::StorageMetaData;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'imageMeta'} = Raritan::RPC::webcam::ImageMetaData::encode($in->{'imageMeta'});
    $encoded->{'fileSize'} = 1 * $in->{'fileSize'};
    $encoded->{'storageMeta'} = Raritan::RPC::webcam::StorageManager_1_0_1::StorageMetaData::encode($in->{'storageMeta'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'imageMeta'} = Raritan::RPC::webcam::ImageMetaData::decode($agent, $in->{'imageMeta'});
    $decoded->{'fileSize'} = $in->{'fileSize'};
    $decoded->{'storageMeta'} = Raritan::RPC::webcam::StorageManager_1_0_1::StorageMetaData::decode($agent, $in->{'storageMeta'});
    return $decoded;
}

1;
