# Do NOT edit this file!
# It was generated by IdlC from ModelPush.idl.

use strict;

package Raritan::RPC::modelpush::ModelPush::Configuration;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'enabled'} = ($in->{'enabled'}) ? JSON::true : JSON::false;
    $encoded->{'interval'} = 1 * $in->{'interval'};
    $encoded->{'host'} = "$in->{'host'}";
    $encoded->{'port'} = 1 * $in->{'port'};
    $encoded->{'path'} = "$in->{'path'}";
    $encoded->{'useHttps'} = ($in->{'useHttps'}) ? JSON::true : JSON::false;
    $encoded->{'caCert'} = "$in->{'caCert'}";
    $encoded->{'useAuth'} = ($in->{'useAuth'}) ? JSON::true : JSON::false;
    $encoded->{'username'} = "$in->{'username'}";
    $encoded->{'password'} = "$in->{'password'}";
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'enabled'} = ($in->{'enabled'}) ? 1 : 0;
    $decoded->{'interval'} = $in->{'interval'};
    $decoded->{'host'} = $in->{'host'};
    $decoded->{'port'} = $in->{'port'};
    $decoded->{'path'} = $in->{'path'};
    $decoded->{'useHttps'} = ($in->{'useHttps'}) ? 1 : 0;
    $decoded->{'caCert'} = $in->{'caCert'};
    $decoded->{'useAuth'} = ($in->{'useAuth'}) ? 1 : 0;
    $decoded->{'username'} = $in->{'username'};
    $decoded->{'password'} = $in->{'password'};
    return $decoded;
}

1;
