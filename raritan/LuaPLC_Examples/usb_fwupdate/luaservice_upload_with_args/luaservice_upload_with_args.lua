-- Uploads a Lua script and set default arguments

require "LuaService"

-- the name of the Lua script to upload
local newScriptFileName = "switch_outlets.lua"
-- the name used to reference on LuaService
local newScriptName = "outletSwitcher"

-- set defaultArgs
local defaultArgs = {}
-- sets powerstate of outlet 1, 3, 5 and 7 to off
defaultArgs["offOutlets"] = "1 3 5 7"
-- sets powerstate of outlet 2, 4 and 6 to on
defaultArgs["onOutlets"]  = "2 4 6"

-- newScriptOptions will contain our script options
local newScriptOptions = {}
newScriptOptions.defaultArgs = defaultArgs
newScriptOptions.autoRestart = false
newScriptOptions.autoStart   = false


-- helper function to convert an error number to text
function strFromError(_e)
  local Mgr = luaservice.Manager
  if _e ==  Mgr.NO_ERROR then
    return "no error"
  elseif _e ==  Mgr.ERR_INVALID_NAME then
    return "err invalid name"
  elseif _e ==  Mgr.ERR_NO_SUCH_SCRIPT then
    return "err no such script"
  elseif _e ==  Mgr.ERR_MAX_SCRIPT_NUMBERS_EXCEEDED then
    return "err max script numbers exceeded"
  elseif _e ==  Mgr.ERR_MAX_SCRIPT_SIZE_EXCEEDED then
    return "err max script size exceeded"
  elseif _e ==  Mgr.ERR_MAX_ALL_SCRIPT_SIZE_EXCEEDED then
    return "err max all script size exceeded"
    elseif _e ==  Mgr.ERR_NOT_TERMINATED then
    return "err not terminated"
  elseif _e ==  Mgr.ERR_NOT_RUNNING then
    return "err not running"
  elseif _e ==  Mgr.ERR_INVALID_ADDR then
    return "err invalid address"
  else
    return "unknown"
  end
end

-- open a file and read its content
local newFile   = io.open(newScriptFileName)
local newScript = newFile:read("*a")

-- get the LuaService manager
local lsManager = luaservice.Manager:getDefault()

-- upload the new script
local status = lsManager:setScript(newScriptName, newScript, newScriptOptions)
print("set script " .. newScriptName .. " returns: " .. strFromError(status))

-- to trigger the script with curl (webpage https://curl.hass.se)
-- fill out the correct address, username and password
-- curl -skd '{ "jsonrpc": "2.0", "method": "startScript", "params": { "name": "outletSwitcher" }, "id":12}' https://admin:raritan@192.168.7.15/luaservice

-- to trigger the script with curl and overwrite the default arguments
-- fill out the correct address, username and password
-- curl -skd '{ "jsonrpc": "2.0", "method": "startScriptWithArgs", "params": { "name": "outletSwitcher", "arguments": [{"key":"onOutlets", "value": "10 12"}, {"key":"offOutlets", "value":"9 11"}] }, "id":14}' https://admin:raritan@192.168.7.15/luaservice
