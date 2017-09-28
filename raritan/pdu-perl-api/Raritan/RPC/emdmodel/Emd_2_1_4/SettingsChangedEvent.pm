# Do NOT edit this file!
# It was generated by IdlC from Emd.idl.

use strict;

package Raritan::RPC::emdmodel::Emd_2_1_4::SettingsChangedEvent;

use constant typeId => "emdmodel.Emd_2_1_4.SettingsChangedEvent:1.0.0";
use Raritan::RPC::event::UserEvent;
use Raritan::RPC::emdmodel::Emd_2_1_4::Settings;
use Raritan::RPC::emdmodel::Emd_2_1_4::Settings;

sub encode {
    my ($in) = @_;
    my $encoded = Raritan::RPC::event::UserEvent::encode($in);
    $encoded->{'oldSettings'} = Raritan::RPC::emdmodel::Emd_2_1_4::Settings::encode($in->{'oldSettings'});
    $encoded->{'newSettings'} = Raritan::RPC::emdmodel::Emd_2_1_4::Settings::encode($in->{'newSettings'});
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = Raritan::RPC::event::UserEvent::decode($agent, $in);
    $decoded->{'oldSettings'} = Raritan::RPC::emdmodel::Emd_2_1_4::Settings::decode($agent, $in->{'oldSettings'});
    $decoded->{'newSettings'} = Raritan::RPC::emdmodel::Emd_2_1_4::Settings::decode($agent, $in->{'newSettings'});
    return $decoded;
}

Raritan::RPC::Registry::registerCodecClass('emdmodel.Emd_2_1_4.SettingsChangedEvent', 1, 0, 0, 'Raritan::RPC::emdmodel::Emd_2_1_4::SettingsChangedEvent');
1;
