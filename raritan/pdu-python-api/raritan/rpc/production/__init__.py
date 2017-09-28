# Do NOT edit this file!
# It was generated by IdlC class idl.json.python.ProxyAsnVisitor.

#
# Section generated from "/home/nb/builds/MEGA/px2-3.3.10-3.3.19-branch-20170217-none-release-none-pdu-raritan/fwcomponents/mkdist/tmp/px2_final/libisys/src/idl/Production.idl"
#

import raritan.rpc
from raritan.rpc import Interface, Structure, ValueObject, Enumeration, typecheck, DecodeException

# interface
class Production(Interface):
    idlType = "production.Production:1.0.0"

    class _enterFactoryConfigMode(Interface.Method):
        name = 'enterFactoryConfigMode'

        @staticmethod
        def encode(password):
            typecheck.is_string(password, AssertionError)
            args = {}
            args['password'] = password
            return args

        @staticmethod
        def decode(rsp, agent):
            _ret_ = rsp['_ret_']
            typecheck.is_int(_ret_, DecodeException)
            return _ret_

    class _leaveFactoryConfigMode(Interface.Method):
        name = 'leaveFactoryConfigMode'

        @staticmethod
        def encode():
            args = {}
            return args

        @staticmethod
        def decode(rsp, agent):
            return None

    class _isFactoryConfigModeEnabled(Interface.Method):
        name = 'isFactoryConfigModeEnabled'

        @staticmethod
        def encode():
            args = {}
            return args

        @staticmethod
        def decode(rsp, agent):
            _ret_ = rsp['_ret_']
            typecheck.is_bool(_ret_, DecodeException)
            return _ret_
    def __init__(self, target, agent):
        super(Production, self).__init__(target, agent)
        self.enterFactoryConfigMode = Production._enterFactoryConfigMode(self)
        self.leaveFactoryConfigMode = Production._leaveFactoryConfigMode(self)
        self.isFactoryConfigModeEnabled = Production._isFactoryConfigModeEnabled(self)