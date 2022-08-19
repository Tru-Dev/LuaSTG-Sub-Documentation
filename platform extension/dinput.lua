---@meta
--- LuaSTG Sub Documentation: DirectInput
--------------------------------------------------------------------------------

--- Migration guide:

-- LuaSTG Plus and Ex Plus simply (and brutally) map DirectInput joystic inputs to
-- 0x92 (146) - 0xB2 (177) and 0xDF (223) - 0xFE (254).  
-- Not only is the joystick sensitivity not modifiable, it doesn't enumerate all devices.
-- LuaSTG Sub exposes the DirectInput API as a platform extension library.

-- Note: DirectInput extensions do not enumerate devices that already support XInput.
-- To get input from an XInput device, use the XInput library.

--------------------------------------------------------------------------------

--- Methods

---@class dinput
local M = {}

--- Refresh the device list and return how many were found.  
--- DirectInput re-enumeration of devices is very time-consuming, so this method
--- should only be called when needed.  
--- Returns 0 if dinput is unavailable or if no device is available.
---@return integer
function M.refresh()
end

--- Gets the number of devices.  
--- Returns 0 if dinput is unavailable or if no device is available.
---@return integer
function M.count()
end

--- Gets device input, call only once per frame.
function M.update()
end

---@class dinput.AxisRange
---@field XMin number
---@field XMax number
---@field YMin number
---@field YMax number
---@field ZMin number
---@field ZMax number
---@field RxMin number
---@field RxMax number
---@field RyMin number
---@field RyMax number
---@field RzMin number
---@field RzMax number
---@field Slider0Min number
---@field Slider0Max number
---@field Slider1Min number
---@field Slider1Max number

--- Gets the value range of the device's analog input.  
--- Can be used to parse `dinput.RawState`.  
--- If the minimum value is equal to the maximum value, then that analog input does not exist.  
--- Index starts at 1.  
--- Returns nil if dinput is not available.
---@param index integer
---@return dinput.AxisRange|nil
function M.getAxisRange(index)
end

--- See https://docs.microsoft.com/en-us/previous-versions/windows/desktop/ee416627(v=vs.85)
---@class dinput.RawState
---@field lX number
---@field lY number
---@field lZ number
---@field lRx number
---@field lRy number
---@field lRz number
---@field rglSlider number[] length 2
---@field rgdwPOV number[] length 4, set to 0xFFFF when not pointing to anything
---@field rgbButtons boolean[] length 32

--- See https://docs.microsoft.com/en-us/previous-versions/windows/desktop/ee416627(v=vs.85)  
--- Index starts at 1.  
--- Returns nil if dinput is not available.
---@param index integer
---@return dinput.RawState
function M.getRawState(index)
end

return M
