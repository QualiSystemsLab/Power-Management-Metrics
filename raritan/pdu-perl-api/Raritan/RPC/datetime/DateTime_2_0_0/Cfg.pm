# Do NOT edit this file!
# It was generated by IdlC from DateTime.idl.

use strict;

package Raritan::RPC::datetime::DateTime_2_0_0::Cfg;

use Raritan::RPC::datetime::DateTime_2_0_0::ZoneCfg;
use Raritan::RPC::datetime::DateTime_2_0_0::NtpCfg;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'zoneCfg'} = Raritan::RPC::datetime::DateTime_2_0_0::ZoneCfg::encode($in->{'zoneCfg'});
    $encoded->{'protocol'} = $in->{'protocol'};
    $encoded->{'deviceTime'} = 1 * $in->{'deviceTime'};
    $encoded->{'ntpCfg'} = Raritan::RPC::datetime::DateTime_2_0_0::NtpCfg::encode($in->{'ntpCfg'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'zoneCfg'} = Raritan::RPC::datetime::DateTime_2_0_0::ZoneCfg::decode($agent, $in->{'zoneCfg'});
    $decoded->{'protocol'} = $in->{'protocol'};
    $decoded->{'deviceTime'} = $in->{'deviceTime'};
    $decoded->{'ntpCfg'} = Raritan::RPC::datetime::DateTime_2_0_0::NtpCfg::decode($agent, $in->{'ntpCfg'});
    return $decoded;
}

1;
