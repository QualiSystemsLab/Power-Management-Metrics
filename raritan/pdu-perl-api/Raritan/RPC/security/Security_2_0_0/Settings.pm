# Do NOT edit this file!
# It was generated by IdlC from Security.idl.

use strict;

package Raritan::RPC::security::Security_2_0_0::Settings;

use Raritan::RPC::security::SSHSettings;
use Raritan::RPC::security::RoleAccessControl;
use Raritan::RPC::security::IpFw_1_0_1;
use Raritan::RPC::security::PasswordSettings;
use Raritan::RPC::security::IpFw_1_0_1;
use Raritan::RPC::security::RoleAccessControl;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'http2httpsRedir'} = ($in->{'http2httpsRedir'}) ? JSON::true : JSON::false;
    $encoded->{'userBlockTimeout'} = 1 * $in->{'userBlockTimeout'};
    $encoded->{'userMaxFailedLogins'} = 1 * $in->{'userMaxFailedLogins'};
    $encoded->{'ipFw'} = Raritan::RPC::security::IpFw_1_0_1::encode($in->{'ipFw'});
    $encoded->{'ipV6Fw'} = Raritan::RPC::security::IpFw_1_0_1::encode($in->{'ipV6Fw'});
    $encoded->{'roleAccessControl'} = Raritan::RPC::security::RoleAccessControl::encode($in->{'roleAccessControl'});
    $encoded->{'roleAccessControlV6'} = Raritan::RPC::security::RoleAccessControl::encode($in->{'roleAccessControlV6'});
    $encoded->{'pwSettings'} = Raritan::RPC::security::PasswordSettings::encode($in->{'pwSettings'});
    $encoded->{'idleTimeout'} = 1 * $in->{'idleTimeout'};
    $encoded->{'singleLogin'} = ($in->{'singleLogin'}) ? JSON::true : JSON::false;
    $encoded->{'sshSettings'} = Raritan::RPC::security::SSHSettings::encode($in->{'sshSettings'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'http2httpsRedir'} = ($in->{'http2httpsRedir'}) ? 1 : 0;
    $decoded->{'userBlockTimeout'} = $in->{'userBlockTimeout'};
    $decoded->{'userMaxFailedLogins'} = $in->{'userMaxFailedLogins'};
    $decoded->{'ipFw'} = Raritan::RPC::security::IpFw_1_0_1::decode($agent, $in->{'ipFw'});
    $decoded->{'ipV6Fw'} = Raritan::RPC::security::IpFw_1_0_1::decode($agent, $in->{'ipV6Fw'});
    $decoded->{'roleAccessControl'} = Raritan::RPC::security::RoleAccessControl::decode($agent, $in->{'roleAccessControl'});
    $decoded->{'roleAccessControlV6'} = Raritan::RPC::security::RoleAccessControl::decode($agent, $in->{'roleAccessControlV6'});
    $decoded->{'pwSettings'} = Raritan::RPC::security::PasswordSettings::decode($agent, $in->{'pwSettings'});
    $decoded->{'idleTimeout'} = $in->{'idleTimeout'};
    $decoded->{'singleLogin'} = ($in->{'singleLogin'}) ? 1 : 0;
    $decoded->{'sshSettings'} = Raritan::RPC::security::SSHSettings::decode($agent, $in->{'sshSettings'});
    return $decoded;
}

1;
