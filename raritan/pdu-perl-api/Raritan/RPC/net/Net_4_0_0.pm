# Do NOT edit this file!
# It was generated by IdlC from Net.idl.

use strict;

package Raritan::RPC::net::Net_4_0_0;

use parent qw(Raritan::RPC::RemoteObject);

use constant typeId => "net.Net:4.0.0";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::net::Net_4_0_0::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}

use constant SUCCESS => 0;

use constant ERR_DNS_TOO_MANY_SERVERS => 100;

use constant ERR_DNS_INVALID_SERVER => 101;

use constant ERR_DNS_TOO_MANY_SEARCH_SUFFIXES => 102;

use constant ERR_DNS_INVALID_SEARCH_SUFFIX => 103;

use constant ERR_ROUTING_IPV4_INVALID_DFLT_GATEWAY_ADDR => 200;

use constant ERR_ROUTING_IPV6_INVALID_DFLT_GATEWAY_ADDR => 201;

use constant ERR_ROUTING_IPV4_INVALID_DEST_ADDR => 202;

use constant ERR_ROUTING_IPV6_INVALID_DEST_ADDR => 203;

use constant ERR_ROUTING_IPV4_INVALID_DEST_PREFIX_LEN => 204;

use constant ERR_ROUTING_IPV6_INVALID_DEST_PREFIX_LEN => 205;

use constant ERR_ROUTING_IPV4_INVALID_NEXTHOP_ADDR => 206;

use constant ERR_ROUTING_IPV6_INVALID_NEXTHOP_ADDR => 207;

use constant ERR_ROUTING_IPV4_INVALID_INTERFACE => 208;

use constant ERR_ROUTING_IPV6_INVALID_INTERFACE => 209;

use constant ERR_ROUTING_IPV4_DEST_IS_NO_NETWORK_ADDR => 210;

use constant ERR_ROUTING_IPV6_DEST_IS_NO_NETWORK_ADDR => 211;

use constant ERR_ROUTING_IPV4_DEST_IS_DUPLICATE => 212;

use constant ERR_ROUTING_IPV6_DEST_IS_DUPLICATE => 213;

use constant ERR_ROUTING_IPV4_NO_NEXTHOP_OR_INTERFACE => 214;

use constant ERR_ROUTING_IPV6_NO_NEXTHOP_OR_INTERFACE => 215;

use constant ERR_ROUTING_IPV4_NEXTHOP_AND_INTERFACE_SET => 216;

use constant ERR_ROUTING_IPV6_NEXTHOP_AND_INTERFACE_SET => 217;

use constant ERR_PF_INVALID_MASTER_DOWNSTREAM_INTERFACE => 300;

use constant ERR_PF_NO_WORKING_MASTER_UPSTREAM_INTERFACE => 301;

use constant ERR_IF_IPV4_INVALID_CONFIG_METHOD => 400;

use constant ERR_IF_IPV6_INVALID_CONFIG_METHOD => 401;

use constant ERR_IF_IPV4_INVALID_STATIC_ADDR => 402;

use constant ERR_IF_IPV6_INVALID_STATIC_ADDR => 403;

use constant ERR_IF_IPV4_INVALID_STATIC_PREFIX_LEN => 404;

use constant ERR_IF_IPV6_INVALID_STATIC_PREFIX_LEN => 405;

use constant ERR_IF_IPV4_INVALID_DHCP_PREF_HOSTNAME => 406;

use constant ERR_IF_IPV6_INVALID_DHCP_PREF_HOSTNAME => 407;

use constant ERR_ETH_IF_UNSUPPORTED_LINKMODE => 500;

use constant ERR_WLAN_IF_INVALID_SSID => 600;

use constant ERR_WLAN_IF_INVALID_BSSID => 601;

use constant ERR_WLAN_IF_INVALID_PSK => 602;

use constant ERR_WLAN_IF_INVALID_EAP_IDENTITY => 603;

use constant ERR_WLAN_IF_INVALID_EAP_PASSWORD => 604;

use constant ERR_WLAN_IF_INVALID_EAP_CERT => 605;

use constant ERR_WLAN_IF_EAP_CERT_VERIFY_FAILED => 606;

use Raritan::RPC::net::Info;

sub getInfo($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getInfo', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::net::Info::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

use Raritan::RPC::net::Settings;

sub getSettings($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getSettings', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::net::Settings::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

use Raritan::RPC::net::Settings;

sub setSettings($$) {
    my ($self, $settings) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'settings'} = Raritan::RPC::net::Settings::encode($settings);
    my $rsp = $agent->json_rpc($self->{'rid'}, 'setSettings', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

use Raritan::RPC::net::PortForwardingProtocolMapping;

sub getPortForwardingProtocolMappings($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getPortForwardingProtocolMappings', $args);
    my $_ret_;
    $_ret_ = [];
    for (my $i0 = 0; $i0 <= $#{$rsp->{'_ret_'}}; $i0++) {
        $_ret_->[$i0] = Raritan::RPC::net::PortForwardingProtocolMapping::decode($agent, $rsp->{'_ret_'}->[$i0]);
    }
    return $_ret_;
}

Raritan::RPC::Registry::registerProxyClass('net.Net', 4, 0, 0, 'Raritan::RPC::net::Net_4_0_0');
1;
