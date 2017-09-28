# Do NOT edit this file!
# It was generated by IdlC class idl.json.python.ProxyAsnVisitor.

#
# Section generated from "/home/nb/builds/MEGA/px2-3.3.10-3.3.19-branch-20170217-none-release-none-pdu-raritan/fwcomponents/mkdist/tmp/px2_final/libnotify_client/src/idl/Log.idl"
#

import raritan.rpc
from raritan.rpc import Interface, Structure, ValueObject, Enumeration, typecheck, DecodeException
import raritan.rpc.logging


# structure
class LogInfo(Structure):
    idlType = "logging.LogInfo:1.0.0"
    elements = ["creationTime", "idFirst", "idNext"]

    def __init__(self, creationTime, idFirst, idNext):
        typecheck.is_long(creationTime, AssertionError)
        typecheck.is_int(idFirst, AssertionError)
        typecheck.is_int(idNext, AssertionError)

        self.creationTime = creationTime
        self.idFirst = idFirst
        self.idNext = idNext

    @classmethod
    def decode(cls, json, agent):
        obj = cls(
            creationTime = int(json['creationTime']),
            idFirst = json['idFirst'],
            idNext = json['idNext'],
        )
        return obj

    def encode(self):
        json = {}
        json['creationTime'] = self.creationTime
        json['idFirst'] = self.idFirst
        json['idNext'] = self.idNext
        return json

# structure
class LogEntry(Structure):
    idlType = "logging.LogEntry:1.0.0"
    elements = ["id", "timestamp", "eventClass", "message"]

    def __init__(self, id, timestamp, eventClass, message):
        typecheck.is_int(id, AssertionError)
        typecheck.is_time(timestamp, AssertionError)
        typecheck.is_string(eventClass, AssertionError)
        typecheck.is_string(message, AssertionError)

        self.id = id
        self.timestamp = timestamp
        self.eventClass = eventClass
        self.message = message

    @classmethod
    def decode(cls, json, agent):
        obj = cls(
            id = json['id'],
            timestamp = raritan.rpc.Time.decode(json['timestamp']),
            eventClass = json['eventClass'],
            message = json['message'],
        )
        return obj

    def encode(self):
        json = {}
        json['id'] = self.id
        json['timestamp'] = raritan.rpc.Time.encode(self.timestamp)
        json['eventClass'] = self.eventClass
        json['message'] = self.message
        return json

# structure
class LogChunk(Structure):
    idlType = "logging.LogChunk:1.0.0"
    elements = ["logCreationTime", "idFirst", "allEntryCnt", "selEntries"]

    def __init__(self, logCreationTime, idFirst, allEntryCnt, selEntries):
        typecheck.is_long(logCreationTime, AssertionError)
        typecheck.is_int(idFirst, AssertionError)
        typecheck.is_int(allEntryCnt, AssertionError)
        for x0 in selEntries:
            typecheck.is_struct(x0, raritan.rpc.logging.LogEntry, AssertionError)

        self.logCreationTime = logCreationTime
        self.idFirst = idFirst
        self.allEntryCnt = allEntryCnt
        self.selEntries = selEntries

    @classmethod
    def decode(cls, json, agent):
        obj = cls(
            logCreationTime = int(json['logCreationTime']),
            idFirst = json['idFirst'],
            allEntryCnt = json['allEntryCnt'],
            selEntries = [raritan.rpc.logging.LogEntry.decode(x0, agent) for x0 in json['selEntries']],
        )
        return obj

    def encode(self):
        json = {}
        json['logCreationTime'] = self.logCreationTime
        json['idFirst'] = self.idFirst
        json['allEntryCnt'] = self.allEntryCnt
        json['selEntries'] = [raritan.rpc.logging.LogEntry.encode(x0) for x0 in self.selEntries]
        return json

# enumeration
class RangeDirection(Enumeration):
    idlType = "logging.RangeDirection:1.0.0"
    values = ["FORWARD", "BACKWARD"]

RangeDirection.FORWARD = RangeDirection(0)
RangeDirection.BACKWARD = RangeDirection(1)
# Do NOT edit this file!
# It was generated by IdlC class idl.json.python.ProxyAsnVisitor.

#
# Section generated from "/home/nb/builds/MEGA/px2-3.3.10-3.3.19-branch-20170217-none-release-none-pdu-raritan/fwcomponents/mkdist/tmp/px2_final/libisys/src/idl/EventLog.idl"
#

import raritan.rpc
from raritan.rpc import Interface, Structure, ValueObject, Enumeration, typecheck, DecodeException
import raritan.rpc.event

import raritan.rpc.logging


# value object
class EventLogClearedEvent(raritan.rpc.event.UserEvent):
    idlType = "logging.EventLogClearedEvent:1.0.0"

    def __init__(self, actUserName, actIpAddr, source):
        super(raritan.rpc.logging.EventLogClearedEvent, self).__init__(actUserName, actIpAddr, source)

    def encode(self):
        json = super(raritan.rpc.logging.EventLogClearedEvent, self).encode()
        return json

    @classmethod
    def decode(cls, json, agent):
        obj = cls(
            # for event.UserEvent
            actUserName = json['actUserName'],
            actIpAddr = json['actIpAddr'],
            # for idl.Event
            source = Interface.decode(json['source'], agent),
        )
        return obj

    def listElements(self):
        elements = []
        elements = elements + super(raritan.rpc.logging.EventLogClearedEvent, self).listElements()
        return elements

# interface
class EventLog(Interface):
    idlType = "logging.EventLog:2.0.0"

    class _clear(Interface.Method):
        name = 'clear'

        @staticmethod
        def encode():
            args = {}
            return args

        @staticmethod
        def decode(rsp, agent):
            return None

    class _getInfo(Interface.Method):
        name = 'getInfo'

        @staticmethod
        def encode():
            args = {}
            return args

        @staticmethod
        def decode(rsp, agent):
            _ret_ = raritan.rpc.logging.LogInfo.decode(rsp['_ret_'], agent)
            typecheck.is_struct(_ret_, raritan.rpc.logging.LogInfo, DecodeException)
            return _ret_

    class _getChunk(Interface.Method):
        name = 'getChunk'

        @staticmethod
        def encode(refId, count, direction, categories):
            typecheck.is_int(refId, AssertionError)
            typecheck.is_int(count, AssertionError)
            typecheck.is_enum(direction, raritan.rpc.logging.RangeDirection, AssertionError)
            for x0 in categories:
                typecheck.is_string(x0, AssertionError)
            args = {}
            args['refId'] = refId
            args['count'] = count
            args['direction'] = raritan.rpc.logging.RangeDirection.encode(direction)
            args['categories'] = [x0 for x0 in categories]
            return args

        @staticmethod
        def decode(rsp, agent):
            _ret_ = raritan.rpc.logging.LogChunk.decode(rsp['_ret_'], agent)
            typecheck.is_struct(_ret_, raritan.rpc.logging.LogChunk, DecodeException)
            return _ret_
    def __init__(self, target, agent):
        super(EventLog, self).__init__(target, agent)
        self.clear = EventLog._clear(self)
        self.getInfo = EventLog._getInfo(self)
        self.getChunk = EventLog._getChunk(self)
# Do NOT edit this file!
# It was generated by IdlC class idl.json.python.ProxyAsnVisitor.

#
# Section generated from "/home/nb/builds/MEGA/px2-3.3.10-3.3.19-branch-20170217-none-release-none-pdu-raritan/fwcomponents/mkdist/tmp/px2_final/libisys/src/idl/WlanLog.idl"
#

import raritan.rpc
from raritan.rpc import Interface, Structure, ValueObject, Enumeration, typecheck, DecodeException
import raritan.rpc.logging


# interface
class WlanLog(Interface):
    idlType = "logging.WlanLog:1.0.0"

    class _clear(Interface.Method):
        name = 'clear'

        @staticmethod
        def encode():
            args = {}
            return args

        @staticmethod
        def decode(rsp, agent):
            return None

    class _getInfo(Interface.Method):
        name = 'getInfo'

        @staticmethod
        def encode():
            args = {}
            return args

        @staticmethod
        def decode(rsp, agent):
            _ret_ = raritan.rpc.logging.LogInfo.decode(rsp['_ret_'], agent)
            typecheck.is_struct(_ret_, raritan.rpc.logging.LogInfo, DecodeException)
            return _ret_

    class _getChunk(Interface.Method):
        name = 'getChunk'

        @staticmethod
        def encode(refId, count, direction):
            typecheck.is_int(refId, AssertionError)
            typecheck.is_int(count, AssertionError)
            typecheck.is_enum(direction, raritan.rpc.logging.RangeDirection, AssertionError)
            args = {}
            args['refId'] = refId
            args['count'] = count
            args['direction'] = raritan.rpc.logging.RangeDirection.encode(direction)
            return args

        @staticmethod
        def decode(rsp, agent):
            _ret_ = raritan.rpc.logging.LogChunk.decode(rsp['_ret_'], agent)
            typecheck.is_struct(_ret_, raritan.rpc.logging.LogChunk, DecodeException)
            return _ret_
    def __init__(self, target, agent):
        super(WlanLog, self).__init__(target, agent)
        self.clear = WlanLog._clear(self)
        self.getInfo = WlanLog._getInfo(self)
        self.getChunk = WlanLog._getChunk(self)
# Do NOT edit this file!
# It was generated by IdlC class idl.json.python.ProxyAsnVisitor.

#
# Section generated from "/home/nb/builds/MEGA/px2-3.3.10-3.3.19-branch-20170217-none-release-none-pdu-raritan/fwcomponents/mkdist/tmp/px2_final/libisys/src/idl/DebugLog.idl"
#

import raritan.rpc
from raritan.rpc import Interface, Structure, ValueObject, Enumeration, typecheck, DecodeException
import raritan.rpc.logging


# interface
class DebugLog(Interface):
    idlType = "logging.DebugLog:2.0.0"

    class _clear(Interface.Method):
        name = 'clear'

        @staticmethod
        def encode():
            args = {}
            return args

        @staticmethod
        def decode(rsp, agent):
            return None

    class _getInfo(Interface.Method):
        name = 'getInfo'

        @staticmethod
        def encode():
            args = {}
            return args

        @staticmethod
        def decode(rsp, agent):
            _ret_ = raritan.rpc.logging.LogInfo.decode(rsp['_ret_'], agent)
            typecheck.is_struct(_ret_, raritan.rpc.logging.LogInfo, DecodeException)
            return _ret_

    class _getChunk(Interface.Method):
        name = 'getChunk'

        @staticmethod
        def encode(refId, count, direction):
            typecheck.is_int(refId, AssertionError)
            typecheck.is_int(count, AssertionError)
            typecheck.is_enum(direction, raritan.rpc.logging.RangeDirection, AssertionError)
            args = {}
            args['refId'] = refId
            args['count'] = count
            args['direction'] = raritan.rpc.logging.RangeDirection.encode(direction)
            return args

        @staticmethod
        def decode(rsp, agent):
            _ret_ = raritan.rpc.logging.LogChunk.decode(rsp['_ret_'], agent)
            typecheck.is_struct(_ret_, raritan.rpc.logging.LogChunk, DecodeException)
            return _ret_
    def __init__(self, target, agent):
        super(DebugLog, self).__init__(target, agent)
        self.clear = DebugLog._clear(self)
        self.getInfo = DebugLog._getInfo(self)
        self.getChunk = DebugLog._getChunk(self)
