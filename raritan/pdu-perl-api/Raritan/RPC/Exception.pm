package Raritan::RPC::Exception;

use strict;
use warnings;

use parent qw(Error);

sub new {
    my $self = shift;
    my $text = "" . (shift) . "\n";
    my @args = ();

    local $Error::Depth = $Error::Depth + 1;
    local $Error::Debug = 1;

    return $self->SUPER::new(-text => $text, @args);
}
1;

package Raritan::RPC::HttpException;
use parent qw(Raritan::RPC::Exception);
1;

package Raritan::RPC::JsonRpcSyntaxException;
use parent qw(Raritan::RPC::Exception);
1;

package Raritan::RPC::JsonRpcErrorException;
use parent qw(Raritan::RPC::Exception);
1;

package Raritan::RPC::DecodeException;
use parent qw(Raritan::RPC::Exception);
1;
