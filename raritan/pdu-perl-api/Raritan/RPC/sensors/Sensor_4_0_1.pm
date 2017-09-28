# Do NOT edit this file!
# It was generated by IdlC from Sensor.idl.

use strict;

package Raritan::RPC::sensors::Sensor_4_0_1;

use parent qw(Raritan::RPC::RemoteObject);

use constant typeId => "sensors.Sensor:4.0.1";

sub new {
    my ($class, $agent, $rid, $typeId) = @_;
    $typeId = $typeId || Raritan::RPC::sensors::Sensor_4_0_1::typeId;
    return $class->SUPER::new($agent, $rid, $typeId);
}

use constant ERR_NOT_SUPPORTED => 1;

use constant NUMERIC => 0;

use constant DISCRETE_ON_OFF => 1;

use constant DISCRETE_MULTI => 2;

use constant UNSPECIFIED => 0;

use constant VOLTAGE => 1;

use constant CURRENT => 2;

use constant UNBALANCE_CURRENT => 3;

use constant POWER => 4;

use constant POWER_FACTOR => 5;

use constant ENERGY => 6;

use constant FREQUENCY => 7;

use constant TEMPERATURE => 8;

use constant HUMIDITY => 9;

use constant AIR_FLOW => 10;

use constant AIR_PRESSURE => 11;

use constant CONTACT_CLOSURE => 12;

use constant ON_OFF_SENSOR => 13;

use constant TRIP_SENSOR => 14;

use constant VIBRATION => 15;

use constant WATER_LEAK => 16;

use constant SMOKE_DETECTOR => 17;

use constant TOTAL_HARMONIC_DISTORTION => 18;

use constant MASS => 19;

use constant ELECTRICAL_RESISTANCE => 20;

use constant FLUX => 21;

use constant LUMINOUS_INTENSITY => 22;

use constant ACCELERATION => 23;

use constant MAGNETIC_FLUX_DENSITY => 24;

use constant ELECTRIC_FIELD_STRENGTH => 25;

use constant MAGNETIC_FIELD_STRENGTH => 26;

use constant ANGLE => 27;

use constant SELECTION => 28;

use constant FAULT_STATE => 29;

use constant POWER_QUALITY => 30;

use constant ROTATIONAL_SPEED => 31;

use constant LUMINOUS_ENERGY => 32;

use constant LUMINOUS_FLUX => 33;

use constant ILLUMINANCE => 34;

use constant LUMINOUS_EMITTANCE => 35;

use constant MOTION => 36;

use constant OCCUPANCY => 37;

use constant TAMPER => 38;

use constant DRY_CONTACT => 39;

use constant POWERED_DRY_CONTACT => 40;

use constant ABSOLUTE_HUMIDITY => 41;

use constant NONE => 0;

use constant VOLT => 1;

use constant AMPERE => 2;

use constant WATT => 3;

use constant VOLT_AMP => 4;

use constant WATT_HOUR => 5;

use constant VOLT_AMP_HOUR => 6;

use constant DEGREE_CELSIUS => 7;

use constant HZ => 8;

use constant PERCENT => 9;

use constant METER_PER_SEC => 10;

use constant PASCAL => 11;

use constant G => 12;

use constant RPM => 13;

use constant METER => 14;

use constant HOUR => 15;

use constant MINUTE => 16;

use constant SECOND => 17;

use constant VOLT_AMP_REACTIVE => 18;

use constant VOLT_AMP_REACTIVE_HOUR => 19;

use constant GRAM => 20;

use constant OHM => 21;

use constant LITERS_PER_HOUR => 22;

use constant CANDELA => 23;

use constant METER_PER_SQARE_SEC => 24;

use constant TESLA => 25;

use constant VOLT_PER_METER => 26;

use constant VOLT_PER_AMPERE => 27;

use constant DEGREE => 28;

use constant DEGREE_FAHRENHEIT => 29;

use constant KELVIN => 30;

use constant JOULE => 31;

use constant COULOMB => 32;

use constant NIT => 33;

use constant LUMEN => 34;

use constant LUMEN_SECOND => 35;

use constant LUX => 36;

use constant PSI => 37;

use constant NEWTON => 38;

use constant FOOT => 39;

use constant FOOT_PER_SEC => 40;

use constant CUBIC_METER => 41;

use constant RADIANT => 42;

use constant STERADIANT => 43;

use constant HENRY => 44;

use constant FARAD => 45;

use constant MOL => 46;

use constant BECQUEREL => 47;

use constant GRAY => 48;

use constant SIEVERT => 49;

use constant G_PER_CUBIC_METER => 50;

use Raritan::RPC::sensors::Sensor_4_0_1::TypeSpec;

sub getTypeSpec($) {
    my ($self) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    my $rsp = $agent->json_rpc($self->{'rid'}, 'getTypeSpec', $args);
    my $_ret_;
    $_ret_ = Raritan::RPC::sensors::Sensor_4_0_1::TypeSpec::decode($agent, $rsp->{'_ret_'});
    return $_ret_;
}

sub setType($$$) {
    my ($self, $type, $unit) = @_;
    my $agent = $self->{'agent'};
    my $args = {};
    $args->{'type'} = 1 * $type;
    $args->{'unit'} = 1 * $unit;
    my $rsp = $agent->json_rpc($self->{'rid'}, 'setType', $args);
    my $_ret_;
    $_ret_ = $rsp->{'_ret_'};
    return $_ret_;
}

Raritan::RPC::Registry::registerProxyClass('sensors.Sensor', 4, 0, 1, 'Raritan::RPC::sensors::Sensor_4_0_1');
1;
