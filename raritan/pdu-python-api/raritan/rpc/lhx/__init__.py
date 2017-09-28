# Do NOT edit this file!
# It was generated by IdlC class idl.json.python.ProxyAsnVisitor.

#
# Section generated from "/home/nb/builds/MEGA/px2-3.3.10-3.3.19-branch-20170217-none-release-none-pdu-raritan/fwcomponents/mkdist/tmp/px2_final/libisys/src/idl/LhxSupport.idl"
#

import raritan.rpc
from raritan.rpc import Interface, Structure, ValueObject, Enumeration, typecheck, DecodeException

# interface
class Support(Interface):
    idlType = "lhx.Support:1.0.0"

    class _setEnabled(Interface.Method):
        name = 'setEnabled'

        @staticmethod
        def encode(enabled):
            typecheck.is_bool(enabled, AssertionError)
            args = {}
            args['enabled'] = enabled
            return args

        @staticmethod
        def decode(rsp, agent):
            return None

    class _isEnabled(Interface.Method):
        name = 'isEnabled'

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
        super(Support, self).__init__(target, agent)
        self.setEnabled = Support._setEnabled(self)
        self.isEnabled = Support._isEnabled(self)