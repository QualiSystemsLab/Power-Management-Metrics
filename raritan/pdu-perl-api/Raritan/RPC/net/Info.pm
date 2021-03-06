# Do NOT edit this file!
# It was generated by IdlC from Net.idl.

use strict;

package Raritan::RPC::net::Info;

use Raritan::RPC::net::InterfaceInfo;
use Raritan::RPC::net::WlanInfo;
use Raritan::RPC::net::CommonInfo;
use Raritan::RPC::net::EthInfo;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'common'} = Raritan::RPC::net::CommonInfo::encode($in->{'common'});
    $encoded->{'ifMap'} = [];
    foreach my $key0 (keys %{$in->{'ifMap'}}) {
        my $value0 = $in->{'ifMap'}->{$key0};
        my $elem0 = {};
        $elem0->{'key'} = "$key0";
        $elem0->{'value'} = Raritan::RPC::net::InterfaceInfo::encode($value0);
        push(@{$encoded->{'ifMap'}}, $elem0);
    }
    $encoded->{'ethMap'} = [];
    foreach my $key0 (keys %{$in->{'ethMap'}}) {
        my $value0 = $in->{'ethMap'}->{$key0};
        my $elem0 = {};
        $elem0->{'key'} = "$key0";
        $elem0->{'value'} = Raritan::RPC::net::EthInfo::encode($value0);
        push(@{$encoded->{'ethMap'}}, $elem0);
    }
    $encoded->{'wlanMap'} = [];
    foreach my $key0 (keys %{$in->{'wlanMap'}}) {
        my $value0 = $in->{'wlanMap'}->{$key0};
        my $elem0 = {};
        $elem0->{'key'} = "$key0";
        $elem0->{'value'} = Raritan::RPC::net::WlanInfo::encode($value0);
        push(@{$encoded->{'wlanMap'}}, $elem0);
    }
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'common'} = Raritan::RPC::net::CommonInfo::decode($agent, $in->{'common'});
    $decoded->{'ifMap'} = {};
    for (my $i0 = 0; $i0 <= $#{$in->{'ifMap'}}; $i0++) {
        my $key0 = $in->{'ifMap'}->[$i0]->{'key'};
        my $value0 = Raritan::RPC::net::InterfaceInfo::decode($agent, $in->{'ifMap'}->[$i0]->{'value'});
        $decoded->{'ifMap'}->{$key0} = $value0;
    }
    $decoded->{'ethMap'} = {};
    for (my $i0 = 0; $i0 <= $#{$in->{'ethMap'}}; $i0++) {
        my $key0 = $in->{'ethMap'}->[$i0]->{'key'};
        my $value0 = Raritan::RPC::net::EthInfo::decode($agent, $in->{'ethMap'}->[$i0]->{'value'});
        $decoded->{'ethMap'}->{$key0} = $value0;
    }
    $decoded->{'wlanMap'} = {};
    for (my $i0 = 0; $i0 <= $#{$in->{'wlanMap'}}; $i0++) {
        my $key0 = $in->{'wlanMap'}->[$i0]->{'key'};
        my $value0 = Raritan::RPC::net::WlanInfo::decode($agent, $in->{'wlanMap'}->[$i0]->{'value'});
        $decoded->{'wlanMap'}->{$key0} = $value0;
    }
    return $decoded;
}

1;
