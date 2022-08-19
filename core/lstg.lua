---@meta
--- LuaSTG Sub Documentation: Core functions
--------------------------------------------------------------------------------

---@class lstg
local M
lstg = M

--------------------------------------------------------------------------------

--- Command line arguments  

-- Available external command line arguments:  
-- 1、--log-window      Enables the engine log window, closes on game exit.  
-- 2、--log-window-wait If the log window is enabled, wait until ESC is pressed to close.

--- Array of command line arguments  
---@type string[]
M.args = {}

--------------------------------------------------------------------------------

--- Game lifecycle

--- 1.  The game framework and Lua VM are initialized.
--- 2.  Loads the `launch` initialization script (optional)
--- 3.  Loads the game's DirectX engine.
--- 4.  Searches for entrypoint scripts `core.lua`, `main.lua`, and `src/main.lua`.
---     Only the first script will be loaded, so if both `core.lua` and `main.lua` are found,
---     `core.lua` is the one loaded.
--- 5.  Runs `GameInit()` to start the game loop.
--- 6.  Runs the game loop, which runs FrameFunc then RenderFunc in that order, once a frame, repeatedly.
--- 7.  Once an exit signal is received, ends the game loop and executes GameExit.
--- 8.  Frees all resources then unloads the game engine, Lua VM, and game framework.

--------------------------------------------------------------------------------

--- Global callback functions (defined globally so the engine can find them and call as needed)

--- Called once, before the game loop starts.
function GameInit()
end

--- Called once every frame of the game loop, before `RenderFunc()`.
--- If it returns `true`, exits the game loop and `GameExit()` is called.
---@return boolean
function FrameFunc()
end

--- Called once per frame of the game loop, after `FrameFunc()`.
function RenderFunc()
end

--- Called once, after the game loop.
function GameExit()
end

--- Called whenever the window loses focus.
function FocusLoseFunc()
end

--- Called whenever the window gains focus.
function FocusGainFunc()
end

return M
