---@meta
--- LuaSTG Sub Documentation: XInput
--------------------------------------------------------------------------------

---@class xinput
local M = {}
xinput = M

--------------------------------------------------------------------------------
--- Migration guide:

-- LuaSTG Ex Plus had an XInputManager.  
-- However, LuaSTG Sub issued in a redesign.

-- lstg.XInputManager.GetKeyState(index:number, keycode:number):boolean :  
-- This method was removed.  
-- It was used to create `lstg.XInputManager` objects in LuaSTG Ex Plus, but this method
-- was deprecated in subsequent updates.  
-- Because `lstg.XInputManager` used to be used as a single instance,
-- GetKeyState only needed `lstg.XInputManager.GetKeyState()`

-- `lstg.XInputManager.GetKeyState()`:  
-- This method has been removed, however, you can emulate it using the following code:
-- ```
-- local xinput = require("xinput")
-- function lstg.XInputManager.GetKeyState(index, keycode)
--     return xinput.getKeyState(index, keycode)
-- end
-- ```

-- `lstg.XInputManager.GetTriggerState(index:number):number, number`:  
-- This method has been removed, however, you can emulate it using the following code:
-- ```
-- local xinput = require("xinput")
-- function lstg.XInputManager.GetTriggerState(index)
--     return xinput.getLeftTrigger(index), xinput.getRightTrigger(index)
-- end
-- ```

-- `lstg.XInputManager.GetThumbState(index:number):number, number, number, number`:  
-- This method has been removed, however, you can emulate it using the following code:
-- ```
-- local xinput = require("xinput")
-- function lstg.XInputManager.GetThumbState(index)
--     return xinput.getLeftThumbX(index)
--     , xinput.getLeftThumbY(index)
--     , xinput.getRightThumbX(index)
--     , xinput.getRightThumbY(index)
-- end
-- ```

-- `lstg.XInputManager.SetMotorSpeed(index:number, low_freq_motor_speed:number, high_freq_motor_speed:number)`:  
-- This method had to be removed due to issues with XInput itself.

-- `lstg.XInputManager.GetMotorSpeed(index:number):number, number`:  
-- This method had to be removed due to issues with XInput itself.

-- `lstg.XInputManager.Refresh():number`:  
-- Replaced by `xinput.refresh():number`.

-- `lstg.XInputManager.Update()`:  
-- Replaced by `xinput.update()`.  
-- Note on changed behavior: this method must now be called explicitly, LuaSTG Sub does not
-- automatically call this method.

-- `lstg.XInputManager.GetDeviceCount():number`:  
-- Replaced by `xinput.refresh():number`.

--------------------------------------------------------------------------------

--- Keycode constants

--- For compatibility only.
M.Null          = 0x0000

--- Dpad up.
M.Up            = 0x0001

--- Dpad down.
M.Down          = 0x0002

--- Dpad left.
M.Left          = 0x0004

--- Dpad right.
M.Right         = 0x0008

--- Generally used as a menu key (like ESC).
M.Start         = 0x0010

--- Generally used as a return button (like ESC).
M.Back          = 0x0020

--- Triggered when you press down the left joystick.
M.LeftThumb     = 0x0040

--- Triggered when you press down the right joystick.
M.RightThumb    = 0x0080

M.LeftShoulder  = 0x0100

M.RightShoulder = 0x0200

M.A             = 0x1000

M.B             = 0x2000

M.X             = 0x4000

M.Y             = 0x8000

--------------------------------------------------------------------------------

--- Methods

--- Re-enumerates device handles and returns how many were found.
---@return number
function M.refresh() end

--- Gets the device input, call only once per frame.
function M.update() end

--- Determines if the handle is connected.
---
--- New in LuaSTG Sub v0.17.2.
---@param index number Starts at 1.
---@return boolean
function M.isConnected(index) end

--- Returns if the specified key is pressed on the specified handle.  
--- When only a keycode is passed, the keycode is checked on all handles.
---@param index number Starts at 1.
---@param keycode number
---@return boolean
---@overload fun(keycode:number):boolean
function M.getKeyState(index, keycode) end

--- Gets the status of the left trigger of the specified handle.
--- When no parameter is passed, it automatically selects a handle to check.
---@param index number Starts at 1.
---@return number
---@overload fun():number
function M.getLeftTrigger(index) end

--- Gets the status of the right trigger of the specified handle.
--- When no parameter is passed, it automatically selects a handle to check.
---@param index number Starts at 1.
---@return number
---@overload fun():number
function M.getRightTrigger(index) end

--- Gets the x-axis value of the left joystick of the specified handle.
--- When no parameter is passed, it automatically selects a handle to check.
---@param index number Starts at 1.
---@return number
---@overload fun():number
function M.getLeftThumbX(index) end

--- Gets the y-axis value of the left joystick of the specified handle.
--- When no parameter is passed, it automatically selects a handle to check.
---@param index number Starts at 1.
---@return number
---@overload fun():number
function M.getLeftThumbY(index) end

--- Gets the x-axis value of the right joystick of the specified handle.
--- When no parameter is passed, it automatically selects a handle to check.
---@param index number Starts at 1.
---@return number
---@overload fun():number
function M.getRightThumbX(index) end

--- Gets the y-axis value of the right joystick of the specified handle.
--- When no parameter is passed, it automatically selects a handle to check.
---@param index number Starts at 1.
---@return number
---@overload fun():number
function M.getRightThumbY(index) end

return M
