# Do NOT edit this file!
# It was generated by IdlC from LuaService.idl.

use strict;

package Raritan::RPC::luaservice::Environment;

sub encode {
    my ($in) = @_;
    my $encoded = {};
    $encoded->{'maxMemoryPerScript'} = 1 * $in->{'maxMemoryPerScript'};
    $encoded->{'maxAmountOfScripts'} = 1 * $in->{'maxAmountOfScripts'};
    $encoded->{'amountOfScripts'} = 1 * $in->{'amountOfScripts'};
    $encoded->{'maxScriptSize'} = 1 * $in->{'maxScriptSize'};
    $encoded->{'maxAllScriptSize'} = 1 * $in->{'maxAllScriptSize'};
    $encoded->{'allScriptSize'} = 1 * $in->{'allScriptSize'};
    $encoded->{'outputBufferSize'} = 1 * $in->{'outputBufferSize'};
    $encoded->{'restartInterval'} = 1 * $in->{'restartInterval'};
    $encoded->{'autoStartDelay'} = 1 * $in->{'autoStartDelay'};
    return $encoded;
}

sub decode {
    my ($agent, $in) = @_;
    my $decoded = {};
    $decoded->{'maxMemoryPerScript'} = $in->{'maxMemoryPerScript'};
    $decoded->{'maxAmountOfScripts'} = $in->{'maxAmountOfScripts'};
    $decoded->{'amountOfScripts'} = $in->{'amountOfScripts'};
    $decoded->{'maxScriptSize'} = $in->{'maxScriptSize'};
    $decoded->{'maxAllScriptSize'} = $in->{'maxAllScriptSize'};
    $decoded->{'allScriptSize'} = $in->{'allScriptSize'};
    $decoded->{'outputBufferSize'} = $in->{'outputBufferSize'};
    $decoded->{'restartInterval'} = $in->{'restartInterval'};
    $decoded->{'autoStartDelay'} = $in->{'autoStartDelay'};
    return $decoded;
}

1;
