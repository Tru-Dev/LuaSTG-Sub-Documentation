---@meta
--- LuaSTG Sub Documentation: User Input
--------------------------------------------------------------------------------

--- Migration guide:

-- Since LuaSTG Sub v0.15.2, keyboard and mouse input is no longer
-- obtained through DirectInput, but through window messages.  
-- The reason behind that is Microsoft has marked DirectInput's
-- keyboard and mouse input as deprecated.

-- lstg.GetLastChar(): string
-- Deprecated, TODO: how to better support text input (including IME)

-- lstg.GetKeyboardState(dinput_san_code: number): boolean
-- This platform extension API has been deprecated and removed

-- lstg.GetAsyncKeyState(vkey: number): boolean
-- This platform extension API has been deprecated and removed

-- lstg.CreateInputDevice
-- lstg.ReleaseInputDevice
-- lstg.AddInputAlias
-- lstg.ClearInputAlias
-- lstg.ResetInput
-- lstg.BindInput
-- lstg.GetVKeyStateEx
-- lstg.ConnectTo
-- lstg.ReceiveData
-- lstg.SendData
-- The connection-related API has been removed
-- If necessary, please use LuaSTG Ex Plus

--------------------------------------------------------------------------------

--- Compatibility API

--- Please use `lstg.Input.Keyboard.GetKeyState()` instead.
---
--- Gets the state of the specified key.  
---@param vkey number https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
---@return boolean
---@deprecated
function lstg.GetKeyState(vkey)
end

--- Please use `lstg.Input.Mouse.GetMousePosition()` instead.
---
--- Bottom-left of the window is the origin, the x-axis is to the right, and the y-axis is up.  
---@return number, number
---@deprecated
function lstg.GetMousePosition()
end

--- Please use `lstg.Input.Mouse.GetKeyState()` instead.
---
--- Gets the state of the specified mouse button.  
--- Indices 0, 1, and 2 represent the left, middle, and right mouse buttons.  
--- Indices 3 and 4 Represents the X1 and X2 mouse buttons.   
---@param index number
---@return boolean
---@deprecated
function lstg.GetMouseState(index)
end

--- Please use `lstg.Input.Keyboard.GetMouseWheelDelta()` instead.
---
--- Gets the mouse wheel increment.  
---
--- Changed in LuaSTG Sub v0.15.2.
---@return number
---@deprecated
function lstg.GetMouseWheelDelta()
end

---@return number
---@deprecated
function lstg.GetLastKey()
end

--------------------------------------------------------------------------------

--- Keyboard and mouse modules.

---@class lstg.Input
---@field Keyboard lstg.Input.Keyboard
---@field Mouse lstg.Input.Mouse
lstg.Input = {}
