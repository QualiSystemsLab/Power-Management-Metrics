import cloudshell.api.cloudshell_api as cs_api
from cloudshell.api.common_cloudshell_api import CloudShellAPIError
import json
import logging
import pypyodbc
from base64 import b64decode
import smtplib
import sys
from collections import deque
import datetime, time
from email.mime.text import MIMEText
sys.path.append("pdu-python-api")
from raritan import rpc
from raritan.rpc import Agent, pdumodel, firmware, devsettings, sensors


class PowerMetrics(object):
    def __init__(self):
        self.errormessage = ''
        self.pdu_row = {}
        self.outlet_row = {}
        self.last_pdu_id = 0
        self.outlets_table = {}
        self.peaks_table = {}
        self.pdu_list = {}
        self.pduOutlet_to_dev = {}
        self.pduPassword = {}
        self.start_time = datetime.datetime.utcnow().isoformat()
        self.json_file_path = 'configs.json'  # '???C:/Users/jibranna/.....' in the IDE is fine
        self.configs = json.loads(open(self.json_file_path).read())

        LOG_DICT = {"DEBUG": 10, "INFO": 20, "WARNING": 30, "WARN": 30, "ERROR": 40, "CRITICAL": 50, "CRIT": 50}
        logging.basicConfig(format='%(asctime)s:%(levelname)s:%(message)s',
                            filename=self.configs["logging_file_path"],
                            level=LOG_DICT[self.configs["logging_level"]])
        # Connect to database
        try:
            self.qualienv = pypyodbc.connect('Driver={SQL Server};Server=' + str(self.configs['sql_server']) +
                                              ';Database=QualiEnv;uid=' + str(self.configs['sql_server_user']) +
                                              ';pwd=' + str(self.configs['sql_server_password']))
            #print "Successfully logged into metrics database."
        except pypyodbc.Error as e:
            print ('Metrics Database Login Failure.  ' + str(e))
            raise

        except Exception as e:
            #Write to output we failed to log - really bad news!
            print ('DB login fault. Terminating. ' + str(e) + '  Seek help!')
            raise
        logging.info('Connected to QualiEnv DB.')

        # start CloudShell API Session
        try:
            self.cs_session = cs_api.CloudShellAPISession(self.configs["qs_server_hostname"],
                                                          self.configs["qs_admin_username"],
                                                          self.configs["qs_admin_password"],
                                                          domain=self.configs["qs_cloudshell_domain"],port=8029)
            logging.info('Connected to CloudShell @ %s', self.configs["qs_server_hostname"])
        except CloudShellAPIError as e:
            msg = self._get_tstamp() + '\n Critical Error connecting to CloudShell' + \
                  '\n' + self.configs["who_am_i"] + ' attempting to start CloudShell API Session' + \
                  '\nServer: ' + self.configs["qs_server_hostname"] + \
                  '\nPlease review logs'
            logging.critical('Unable to connect to CloudShell on Server: %s', self.configs["qs_server_hostname"])
            logging.critical(e.message)
            logging.debug(msg)
            logging.debug('CloudShell Credentials: User= %s | Password= %s', self.configs["qs_admin_username"],
                          b64decode(self.configs["qs_admin_password"]))
            logging.debug('CloudShell Domain: %s', self.configs["qs_cloudshell_domain"])

            # self.send_email('Error connecting to CloudShell', msg)

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------
    def _get_tstamp(self):
        return time.strftime('%Y-%m-%d %H:%M:%S')

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------
    def get_pdu_data(self):
        self.pdu_list = {}
        self.pduPassword = {}
        self.pduOutlet_to_dev = {}
        found = self.cs_session.FindResources(resourceFamily="PDU", resourceModel="Raritan PDU", showAllDomains=True)
        for pdu in found.Resources:
            self.pdu_list.update({pdu.Address: pdu.Name})
            pduDetails = self.cs_session.GetResourceDetails(pdu.Name)
            for attrib in pduDetails.ResourceAttributes:
                if attrib.Name == "Password":
                    realpassword = self.cs_session.DecryptPassword(attrib.Value).Value
                    #print realpassword
                    self.pduPassword.update({pdu.Address:str(realpassword)})
            for outlet in pduDetails.ChildResources:
                rootOutletName = outlet.Name.rsplit('/',1)[-1]
                if len(outlet.Connections) == 1:
                    resourceParentName = outlet.Connections[0].FullPath.split('/',1)[0]
                    self.pduOutlet_to_dev.update({pdu.Address + "/" + rootOutletName: resourceParentName})
                else:
                    self.pduOutlet_to_dev.update({pdu.Address + "/" + rootOutletName: "none"})
        return self.pdu_list, self.pduOutlet_to_dev, self.pduPassword

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------
    def get_globals_attribs(self):
        found = self.cs_session.FindResources(resourceFamily="Pool", resourceModel="Config Set Pool",
                                              showAllDomains=True)
        for gres in found.Resources:
            #print gres.Name + ' found.'
            gresDetails = self.cs_session.GetResourceDetails(gres.Name)
            return gresDetails.ResourceAttributes

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------
    def main(self):
        self.errormessage = ''
        print self.start_time
        pm = PowerMetrics()
        self.pdu_list, self.pduOutlet_to_dev, self.pduPassword = pm.get_pdu_data()
        sqrt3 = 1.732050808

        for ip in self.pdu_list:
            try:
                print "\nProcessing " + self.pdu_list[ip] + "     " + self.pduPassword[ip] + "   " + time.strftime('%Y-%m-%d %H:%M:%S')
                logging.info("Processing " + self.pdu_list[ip] + "     " + time.strftime('%Y-%m-%d %H:%M:%S'))
                agent = rpc.Agent("https", ip, str(self.configs['raritan_user']), self.pduPassword[ip],
                          timeout=15, disable_certificate_verification=True)
                pdu = rpc.pdumodel.Pdu("/model/pdu/0", agent)
                inlets = pdu.getInlets()
            except Exception as ex:
                print "OH NO! Could not access pdu at " + ip + '  pass ' + self.pduPassword[ip] + "  " + ex.message
                self.errormessage += "\nOH NO! Could not access pdu at " + ip + '  ' + ex.message
                logging.info(self.errormessage)
                self.emailalert('Power Metrics Fault (1)', self.errormessage)
                continue

            outlets = pdu.getOutlets()
            inlet = inlets[0]
            poles = inlet.getPoles()
            print ("PDU: %s(%s) inlets: %d  poles: %d  outlets: %d " % (ip, self.pdu_list[ip], len(inlets),
                                                                        len(poles), len(outlets)))
            inlet_sensors = inlet.getSensors()
            sensor_reading = inlet_sensors.powerFactor.getReading()
            inlet_power_factor = sensor_reading.value
            VA = 0
            Watts = 0

            self.pdu_row = {}
            self.pdu_row.update({"pdu-ip":ip, "pdu-name":self.pdu_list[ip]})
            for pole_num in range(0,len(poles)):
                pole = poles[pole_num]
                pn = pole.nodeId
                if pole.current:
                    pvolts = pole.voltage.getReading()
                    pcurrent = pole.current.getReading()
                    print ("Phase: %s   %.1f V   %.2f A " % (pn,pvolts.value,pcurrent.value))
                    VA += ((pvolts.value * pcurrent.value)/sqrt3)
                    self.pdu_row.update({"line" + str(pn) + "-voltage": pvolts.value})
                    self.pdu_row.update({"line" + str(pn) + "-amps": pcurrent.value})
                else:
                    print ("Phase: %s   %.1f V   %.2f A   pf: %s " % (pn,0,0,inlet_power_factor))
                    self.pdu_row.update({"line" + str(pn) + "-voltage": "0"})
                    self.pdu_row.update({"line" + str(pn) + "-amps": "0"})

            Watts += VA * inlet_power_factor
            print ("%.1f VA   %.1f Watts   pf: %.3f " % (VA, Watts, inlet_power_factor))
            self.pdu_row.update({"tot-va": VA, "tot-watts": Watts, "in-power-factor": inlet_power_factor})
            # Post to DB
            self.putpdu()
            print "Root data saved for " + self.pdu_list[ip]

            # -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

            outline = ''

            tot_amps = 0
            self.outlet_row = {}
            self.outlet_row.update({"pdu-id": self.last_pdu_id})

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
                self.outlet_row.update({"outlet-num": str(metadata.label)})

                voltage = voltages[i]
                if voltage:
                    outline += ("  %s" % (("%.1f V" % (voltage.value)) if voltage.valid else "n/a"))
                    self.outlet_row.update({"voltage": ("%s" % (("%.1f" % (voltage.value)) if voltage.valid else "0"))})

                current = currents[i]
                if current:
                    tot_amps += current.value
                    outline += ("  %s" % (("%.2f A" % (current.value)) if current.valid else "n/a"))
                    self.outlet_row.update({"amps": str(current.value)})

                power_factor = power_factors[i]
                if power_factor:
                    outline += ("    pf: %.2f " % (power_factor.value))
                    self.outlet_row.update({"power-factor": ("%.2f" % (power_factor.value))})

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
                    self.outlet_row.update({"state": outlet_onoff})

                connected = self.pduOutlet_to_dev[ip + "/Socket " + metadata.label]
                outline += ("   res: %s " % connected)
                self.outlet_row.update({"resource": str(connected)})
                #print(self.outlet_row)
                #  Push to DB
                self.putoutlets()
                #print(outline)


            print "-----------------------------------------------------------"
        print "Done @ %s    Closing database." % (datetime.datetime.utcnow().isoformat())
        self.qualienv.close()

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------
    def putpdu(self):
        # COLUMNS in table
        #  1 [pdu-ip] [varchar](16) NOT NULL,
        #  2 [pdu-name] [varchar](80) NOT NULL,
        #  3 [line1-voltage] [dec](6,2) NOT NULL,
        #  4 [line2-voltage] [dec](6,2) NOT NULL,
        #  5 [line3-voltage] [dec](6,2) NOT NULL,
        #  6 [line1-amps] [dec](6,2) NOT NULL,
        #  7 [line2-amps] [dec](6,2) NOT NULL,
        #  8 [line3-amps] [dec](6,2) NOT NULL,
        #  9 [tot-va] [dec](8,1) NOT NULL,
        # 10 [tot-watts] [dec](8,1) NOT NULL,
        # 11 [in-power-factor] [dec](4,3) NOT NULL,
        # 12 timestamp
        try:
            cursor = self.qualienv.cursor()
            # Cols: pdu-ip, pdu-name, line(1-3)-voltage, line(1-3)-amps, tot-va, tot-watts, in-power-factor
            SQLCommand = ("INSERT INTO PDU VALUES(?,?,?,?, ?,?,?,?, ?,?,?, GetUtcDate())")
            Values= []
            Values.append(self.pdu_row['pdu-ip'])
            Values.append(self.pdu_row['pdu-name'])
            Values.append(self.pdu_row['line1-voltage'])
            Values.append(self.pdu_row['line2-voltage'])
            Values.append(self.pdu_row['line3-voltage'])
            Values.append(self.pdu_row['line1-amps'])
            Values.append(self.pdu_row['line2-amps'])
            Values.append(self.pdu_row['line3-amps'])
            Values.append(self.pdu_row['tot-va'])
            Values.append(self.pdu_row['tot-watts'])
            Values.append(self.pdu_row['in-power-factor'])

            cursor.execute(SQLCommand,Values)
            self.qualienv.commit()
            cursor.execute("SELECT @@IDENTITY")
            datarow = cursor.fetchone()
            self.last_pdu_id = datarow[0]
            print 'PDU data logged, pdu-id %s ' % (self.last_pdu_id)

        except pypyodbc.Error as e:
            print ('PDU Data Logging failure.  ' + str(e))
            self.errormessage += '\nPDU Data Logging failure.  ' + str(e)
            logging.info(self.errormessage)
            self.emailalert('Power Metrics Fault (1)', self.errormessage)
            raise

        except Exception as e:
            print ('Major pdu log fault. ' + str(e) + '  Seek help!')
            self.errormessage += '\nMajor pdu log fault. ' + str(e) + '  Seek help!'
            logging.info(self.errormessage)
            self.emailalert('Power Metrics Fault (1)', self.errormessage)
            raise

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------
    def putoutlets(self):
        # COLUMNS in table
        # 1 pdu-id
        # 2 outlet-num
        # 3 voltage
        # 4 amps
        # 5 power-factor
        # 6 state
        # first query to get PDU ID
        try:
            cursor = self.qualienv.cursor()
            SQLCommand = ("INSERT INTO OUTLETS VALUES(?,?,?, ?,?,?, GetUtcDate())")
            Values= []
            Values.append(self.outlet_row['pdu-id'])
            Values.append(self.outlet_row['outlet-num'])
            Values.append(self.outlet_row['voltage'])
            Values.append(self.outlet_row['amps'])
            Values.append(self.outlet_row['power-factor'])
            Values.append(self.outlet_row['state'])

            cursor.execute(SQLCommand,Values)
            self.qualienv.commit()
            cursor.execute("SELECT @@IDENTITY")
            datarow = cursor.fetchone()
            self.last_outlet_id = datarow[0]

            # select row from PEAKS
            # if not found, add
            # if found, test peak-amps and update if now larger
            # test resource-name and update if different
            #print str(self.pdu_row['pdu-ip'])
            sql = "SELECT [peak-amps], [resource-name] FROM PEAKS " + \
                  "WHERE [pdu-ip] = '" + str(self.pdu_row["pdu-ip"]) + "' " + \
                  "and [outlet-num] = " + str(self.outlet_row["outlet-num"])
            sql = sql.replace('\\','')
            #print sql
            cursor.execute(sql)
            resourcepeakrows = cursor.fetchall()
            if len(resourcepeakrows) > 0:
                for peakrow in resourcepeakrows:
                    if float(peakrow[0]) < float(self.outlet_row['amps']):
                        sql = "UPDATE PEAKS SET [peak-amps] = " + str(self.outlet_row["amps"]) + \
                              ", [voltage] = " + str(self.outlet_row["voltage"]) + \
                              ", [timestamp] = GetUTCDate() " + \
                              "WHERE [pdu-ip] = '" + str(self.pdu_row["pdu-ip"]) + \
                              "' and [outlet-num] = " + str(self.outlet_row["outlet-num"])
                        #print sql
                        cursor.execute(sql)
                    if peakrow[1] != self.outlet_row['resource']:
                        sql = "UPDATE PEAKS SET [resource-name] = " + str(self.outlet_row["resource"]) + \
                              " WHERE [pdu-ip] = '" + str(self.pdu_row["pdu-ip"]) + \
                              "' and [outlet-num] = " + str(self.outlet_row["outlet-num"])
                        cursor.execute(sql)
            else:
                sql = "INSERT PEAKS VALUES('" + str(self.pdu_row['pdu-ip']) + "'," + \
                      str(self.outlet_row["outlet-num"]) + "," + self.outlet_row["voltage"] + "," + \
                      self.outlet_row["amps"] + ",'" + \
                      self.outlet_row["resource"] + "', GetUTCDate())"
                cursor.execute(sql)

        except pypyodbc.Error as e:
            print ('Outlet Data Logging failure.  ' + str(e))
            self.errormessage += '\nOutlet Data Logging failure.  ' + str(e)
            logging.info(self.errormessage)
            self.emailalert('Power Metrics Fault (1)', self.errormessage)
            raise

        except Exception as e:
            print ('Major outlet log fault. ' + str(e) + '  Seek help!')
            self.errormessage += '\nMajor outlet log fault. ' + str(e) + '  Seek help!'
            logging.info(self.errormessage)
            self.emailalert('Power Metrics Fault (1)', self.errormessage)
            raise

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------
    def get_attribute(self, gresattribs, attribute_name):
        attribute_name_lower = attribute_name.lower()
        for attribute in gresattribs:
            if attribute.Name.lower() == attribute_name_lower or attribute.Name.lower().endswith('.' + attribute_name_lower):
                if attribute.Type == 'Password':
                    decrypted = self.cs_session.DecryptPassword(attribute.Value)
                    return decrypted.Value
                else:
                    return attribute.Value
        raise CloudShellAPIError("Attribute: '" + attribute_name + "' not found")

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------
    def emailalert(self, subject, body, ishtml=False):
        try:
            gresattribs = self.get_globals_attribs()
            host = self.get_attribute(gresattribs, 'ConfigPool_SMTP_Server')
            port = self.get_attribute(gresattribs, "ConfigPool_SMTP_port")
            emailfrom = self.get_attribute(gresattribs, "ConfigPool_SMTP_from")
            emailto = emailfrom
            emailcc = ''
            emailbcc = ''
            try:
                if ishtml:
                    emsg = MIMEText(body + '\n\n', 'html')
                else:
                    emsg = MIMEText(body + '\n\n', 'plain')

                emsg['Subject'] = subject
                emsg['From'] = emailfrom
                emsg['To'] = ",".join([emailto])
                emsg['CC'] = ""
                emsg.preamble = subject
                tolist = emailto.split(",") + emailcc.split(",") + emailbcc.split(",")
                mailer = smtplib.SMTP(host=host, port=port)
                mailer.sendmail(emailfrom, tolist, emsg.as_string())
                return "Emailed OK"

            except smtplib.SMTPException as e:
                # cannot post again as error or we could be in a loop!
                logging.info("ERROR Failed to send email, %s" % str(e))
                return ("ERROR Failed to send email, %s" % str(e))
            except Exception as ex:
                # cannot post again as error or we could be in a loop!
                logging.info("ERROR Failed to send email(1) " + ex.message)
                return "ERROR Failed to send email(1) " + ex.message
        except Exception as ex:
            logging.info("ERROR Failed to send email(2) " + ex.message)
            return "ERROR Failed to send email(2) " + ex.message

# -------------------------------------------------------------------------
# -------------------------------------------------------------------------
if __name__ == '__main__':
    pm = PowerMetrics()
    pm.main()


