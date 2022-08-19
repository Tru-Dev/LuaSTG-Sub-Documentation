---@meta
--- LuaSTG Sub Documentation: Mouse Input
--------------------------------------------------------------------------------

--- New in LuaSTG v0.15.6.
---@class lstg.Input.Mouse
local M = {}

--------------------------------------------------------------------------------

--- Button code constants
--- Note: The values of these constants are related to the internal implementation,
--- DO NOT use numeric values directly, they should be accessed through constants

M.None = 0
M.Primary = 1
M.Left = 1
M.Middle = 4
M.Secondary = 2
M.Right = 2
M.X1 = 5
M.XButton1 = 5
M.X2 = 6
M.XButton2 = 6

--------------------------------------------------------------------------------

--- Mouse methods

--- Gets the state of the specified mouse button.
---@param code number
---@return boolean
function M.GetKeyState(code)
end

--- Gets the mouse position.  
--- By default, the bottom-left corner of the window is taken as the origin,
--- but if you specify `no_Y_flip` the origin will be the top left.
---@param no_Y_flip boolean|nil
---@return number, number
function M.GetPosition(no_Y_flip)
end

--- Get the mouse wheel increment, already divided by 120.0  
---@return number
function M.GetWheelDelta()
end

return M
