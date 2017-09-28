# Do NOT edit this file!
# It was generated by IdlC from Net.idl.

use strict;

package Raritan::RPC::net::Settings;

use Raritan::RPC::net::CommonSettings;
use Raritan::RPC::net::EthSettings;
use Raritan::RPC::net::InterfaceSettings;
use Raritan::RPC::net::WlanSettings;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'common'} = Raritan::RPC::net::CommonSettings::encode($in->{'common'});
    $encoded->{'ifMap'} = [];
    foreach my $key0 (keys %{$in->{'ifMap'}}) {
        my $value0 = $in->{'ifMap'}->{$key0};
        my $elem0 = {};
        $elem0->{'key'} = "$key0";
        $elem0->{'value'} = Raritan::RPC::net::InterfaceSettings::encode($value0);
        push(@{$encoded->{'ifMap'}}, $elem0);
    }
    $encoded->{'ethMap'} = [];
    foreach my $key0 (keys %{$in->{'ethMap'}}) {
        my $value0 = $in->{'ethMap'}->{$key0};
        my $elem0 = {};
        $elem0->{'key'} = "$key0";
        $elem0->{'value'} = Raritan::RPC::net::EthSettings::encode($value0);
        push(@{$encoded->{'ethMap'}}, $elem0);
    }
    $encoded->{'wlanMap'} = [];
    foreach my $key0 (keys %{$in->{'wlanMap'}}) {
        my $value0 = $in->{'wlanMap'}->{$key0};
        my $elem0 = {};
        $elem0->{'key'} = "$key0";
        $elem0->{'value'} = Raritan::RPC::net::WlanSettings::encode($value0);
        push(@{$encoded->{'wlanMap'}}, $elem0);
    }
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'common'} = Raritan::RPC::net::CommonSettings::decode($agent, $in->{'common'});
    $decoded->{'ifMap'} = {};
    for (my $i0 = 0; $i0 <= $#{$in->{'ifMap'}}; $i0++) {
        my $key0 = $in->{'ifMap'}->[$i0]->{'key'};
        my $value0 = Raritan::RPC::net::InterfaceSettings::decode($agent, $in->{'ifMap'}->[$i0]->{'value'});
        $decoded->{'ifMap'}->{$key0} = $value0;
    }
    $decoded->{'ethMap'} = {};
    for (my $i0 = 0; $i0 <= $#{$in->{'ethMap'}}; $i0++) {
        my $key0 = $in->{'ethMap'}->[$i0]->{'key'};
        my $value0 = Raritan::RPC::net::EthSettings::decode($agent, $in->{'ethMap'}->[$i0]->{'value'});
        $decoded->{'ethMap'}->{$key0} = $value0;
    }
    $decoded->{'wlanMap'} = {};
    for (my $i0 = 0; $i0 <= $#{$in->{'wlanMap'}}; $i0++) {
        my $key0 = $in->{'wlanMap'}->[$i0]->{'key'};
        my $value0 = Raritan::RPC::net::WlanSettings::decode($agent, $in->{'wlanMap'}->[$i0]->{'value'});
        $decoded->{'wlanMap'}->{$key0} = $value0;
    }
    return $decoded;
}

1;
