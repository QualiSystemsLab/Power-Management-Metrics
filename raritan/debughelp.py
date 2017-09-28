import cloudshell.api.cloudshell_api as cs_api
from cloudshell.api.common_cloudshell_api import CloudShellAPIError
import json
import logging
from base64 import b64decode
import re, sys, os, time
sys.path.append("pdu-python-api")
from raritan.rpc import Agent, pdumodel, firmware


class PowerMetrics(object):
    def __init__(self):
        self.pdu_list = []
        self.run_started = time.strftime('%A')
        print self.run_started
        self.json_file_path = 'configs.json'  # '???C:/Users/jibranna/.....' in the IDE is fine
        self.configs = json.loads(open(self.json_file_path).read())

    def get_pdu_list(self):
        x=2

    def get_connected_to(self):
        # pdu - outlet - resourcename
        x=3

    def jdebug(self):
        print self.configs

    def main(self):
        print "in main"

if __name__ == '__main__':
    pm = PowerMetrics()
    pm.main()
