import sys
from collections import deque
sys.path.append("pdu-python-api")
from raritan import rpc
from raritan.rpc import Agent, pdumodel, firmware, devsettings, sensors


agent = rpc.Agent("https", "10.199.100.208:50000", "admin", "raritan", disable_certificate_verification = True)
pdu = pdumodel.Pdu("/model/pdu/0", agent)
outlets = pdu.getOutlets()

outline = ''
tot_amps = 0

outlet_row = {}
last_pdu_id = 42
outlet_row.update({"pdu-id": last_pdu_id})

# first bulk request: getMetaData and getSensors for all outlets
bulk = rpc.BulkRequestHelper(agent)
for outlet in outlets:
    bulk.add_request(outlet.getMetaData)
for outlet in outlets:
    bulk.add_request(outlet.getSensors)

metadatas_and_sensors = bulk.perform_bulk()
outlet_metadatas = metadatas_and_sensors[:len(outlets)]
outlet_sensors = metadatas_and_sensors[len(outlets):]

# second bulk request: retrieve sensor readings from all outlets
bulk = rpc.BulkRequestHelper(agent)
for os in outlet_sensors:
    if os.voltage:
        bulk.add_request(os.voltage.getReading)
    if os.current:
        bulk.add_request(os.current.getReading)
    if os.powerFactor:
        bulk.add_request(os.powerFactor.getReading)
    if os.outletState:
        bulk.add_request(os.outletState.getState)
all_readings = deque(bulk.perform_bulk())

voltages = []
currents = []
power_factors = []
outlet_states = []

for os in outlet_sensors:
    if os.voltage:
        voltages.append(all_readings.popleft())
    else:
        voltages.append(None)

    if os.current:
        currents.append(all_readings.popleft())
    else:
        currents.append(None)

    if os.powerFactor:
        power_factors.append(all_readings.popleft())
    else:
        power_factors.append(None)

    if os.outletState:
        outlet_states.append(all_readings.popleft())
    else:
        outlet_states.append(None)

for i in range(len(outlets)):
    metadata = outlet_metadatas[i]
    outline = "Socket %s: " % metadata.label
    outlet_row.update({"outlet-num": str(metadata.label)})

    voltage = voltages[i]
    if voltage:
        outline += ("  %s" % (("%.1f V" % (voltage.value)) if voltage.valid else "n/a"))
        outlet_row.update({"voltage": ("  %s" % (("%.1f" % (voltage.value)) if voltage.valid else "0"))})

    current = currents[i]
    if current:
        tot_amps += current.value
        outline += ("  %s" % (("%.2f A" % (current.value)) if current.valid else "n/a"))
        outlet_row.update({"amps": str(current.value)})

    power_factor = power_factors[i]
    if power_factor:
        outline += ("    pf: %.2f " % (power_factor.value))
        outlet_row.update({"power-factor": (str(power_factor.value))})

    outlet_state = outlet_states[i]
    if outlet_state:
        if outlet_state.available:
            if outlet_state.value == sensors.Sensor.OnOffState.ON.val:
                outlet_onoff = "on"
            else:
                outlet_onoff = "off"
        else:
            outlet_onoff = "na"
        outline += ("   on/off: %s" % (outlet_onoff))
        outlet_row.update({"state": outlet_onoff})

    print(outline)
    print(outlet_row)
