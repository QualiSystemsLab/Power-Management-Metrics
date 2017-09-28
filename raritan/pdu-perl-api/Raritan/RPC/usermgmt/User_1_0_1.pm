# Do NOT edit this file!
# It was generated by IdlC from User.idl.

use strict;

package Raritan::RPC::usermgmt::User_1_0_1;

use parent qw(Raritan::RPC::RemoteObject);

use constant typeId => "usermgmt.User:1.0.1";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::usermgmt::User_1_0_1::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}

use constant ERR_PASSWORD_UNCHANGED => 1;

use constant ERR_PASSWORD_EMPTY => 2;

use constant ERR_PASSWORD_TOO_SHORT => 3;

use constant ERR_PASSWORD_TOO_LONG => 4;

use constant ERR_PASSWORD_CTRL_CHARS => 5;

use constant ERR_PASSWORD_NEED_LOWER => 6;

use constant ERR_PASSWORD_NEED_UPPER => 7;

use constant ERR_PASSWORD_NEED_NUMERIC => 8;

use constant ERR_PASSWORD_NEED_SPECIAL => 9;

use constant ERR_PASSWORD_IN_HISTORY => 10;

use constant ERR_PASSWORD_TOO_SHORT_FOR_SNMP => 11;

use constant ERR_INVALID_ARGUMENT => 12;

use Raritan::RPC::usermgmt::UserInfo;

sub getInfo($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getInfo', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::usermgmt::UserInfo::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

sub setAccountPassword($$) {
    my ($self, $password) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'password'} = "$password";
    my $rsp = $agent->json_rpc($self->{'rid'}, 'setAccountPassword', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

use Raritan::RPC::usermgmt::UserInfo;

sub updateAccountFull($$$) {
    my ($self, $password, $info) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'password'} = "$password";
    $args->{'info'} = Raritan::RPC::usermgmt::UserInfo::encode($info);
    my $rsp = $agent->json_rpc($self->{'rid'}, 'updateAccountFull', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

use Raritan::RPC::usermgmt::UserInfo;
use Raritan::RPC::usermgmt::Role::Privilege;

sub getInfoAndPrivileges($$$) {
    my ($self, $info, $privileges) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getInfoAndPrivileges', $args);
    $$info = Raritan::RPC::usermgmt::UserInfo::decode($agent, $rsp->{'info'});
    $$privileges = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'privileges'}}; $i0++) {
        $$privileges->[$i0] = Raritan::RPC::usermgmt::Role::Privilege::decode($agent, $rsp->{'privileges'}->[$i0]);
    }
}

use Raritan::RPC::usermgmt::Preferences;

sub setPreferences($$) {
    my ($self, $prefs) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'prefs'} = Raritan::RPC::usermgmt::Preferences::encode($prefs);
    my $rsp = $agent->json_rpc($self->{'rid'}, 'setPreferences', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

use Raritan::RPC::usermgmt::UserCapabilities;

sub getCapabilities($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getCapabilities', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::usermgmt::UserCapabilities::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

Raritan::RPC::Registry::registerProxyClass('usermgmt.User', 1, 0, 1, 'Raritan::RPC::usermgmt::User_1_0_1');
1;
