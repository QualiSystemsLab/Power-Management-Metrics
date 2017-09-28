# Do NOT edit this file!
# It was generated by IdlC from SessionManager.idl.

use strict;

package Raritan::RPC::session::SessionManager;

use parent qw(Raritan::RPC::RemoteObject);

use constant typeId => "session.SessionManager:1.0.0";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::session::SessionManager::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}

use constant ERR_ACTIVE_SESSION_EXCLUSIVE_FOR_USER => 1;

use Raritan::RPC::session::Session;

sub newSession($$) {
    my ($self, $session) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'newSession', $args);
    $$session = Raritan::RPC::session::Session::decode($agent, $rsp->{'session'});
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

use Raritan::RPC::session::Session;

sub getSession($$) {
    my ($self, $token) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'token'} = "$token";
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getSession', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::session::Session::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

use Raritan::RPC::session::Session;

sub getCurrentSession($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getCurrentSession', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::session::Session::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

use Raritan::RPC::session::Session;

sub getSessions($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getSessions', $args);
    my $_ret_;
    $_ret_ = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'_ret_'}}; $i0++) {
        $_ret_->[$i0] = Raritan::RPC::session::Session::decode($agent, $rsp->{'_ret_'}->[$i0]);
    }
    return $_ret_;
}


sub closeSession($$$) {
    my ($self, $token, $reason) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'token'} = "$token";
    $args->{'reason'} = $reason;
    my $rsp = $agent->json_rpc($self->{'rid'}, 'closeSession', $args);
}


sub closeCurrentSession($$) {
    my ($self, $reason) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'reason'} = $reason;
    my $rsp = $agent->json_rpc($self->{'rid'}, 'closeCurrentSession', $args);
}

sub touchSession($$) {
    my ($self, $token) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'token'} = "$token";
    my $rsp = $agent->json_rpc($self->{'rid'}, 'touchSession', $args);
}

sub touchCurrentSession($$) {
    my ($self, $userActivity) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'userActivity'} = ($userActivity) ? JSON::true : JSON::false;
    my $rsp = $agent->json_rpc($self->{'rid'}, 'touchCurrentSession', $args);
}

use Raritan::RPC::session::HistoryEntry;

sub getSessionHistory($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getSessionHistory', $args);
    my $_ret_;
    $_ret_ = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'_ret_'}}; $i0++) {
        $_ret_->[$i0] = Raritan::RPC::session::HistoryEntry::decode($agent, $rsp->{'_ret_'}->[$i0]);
    }
    return $_ret_;
}

Raritan::RPC::Registry::registerProxyClass('session.SessionManager', 1, 0, 0, 'Raritan::RPC::session::SessionManager');
1;