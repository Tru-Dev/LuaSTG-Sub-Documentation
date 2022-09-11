---@meta
--- LuaSTG Sub Documentation: Framework Methods
--------------------------------------------------------------------------------

--- Migration guide: 
--- `lstg.ShowSplashWindow()` functionality was removed, leaving only an empty method.

--------------------------------------------------------------------------------

--- Version Information

--- Get the engine version numbers, representing major, minor, patch.
---
--- New in LuaSTG Sub v0.15.6.
---@return number, number, number
function lstg.GetVersionNumber()
end

--- Get the engine version human-readable name, for example `LuaSTG Sub v0.10.0-beta`.
---
--- New in LuaSTG Sub v0.15.6.
---@return string
function lstg.GetVersionName()
end

--------------------------------------------------------------------------------

--- Output Log

---@alias lstg.LogLevel
---| 1 # Debug
---| 2 # Info
---| 3 # Warning
---| 4 # Error
---| 5 # Fatal

--- Log to the console and engine log file.
---@param level lstg.LogLevel
---@param msg string
function lstg.Log(level, msg)
end

--- Outputs a message to the log at info level.
---@param msg string
function lstg.SystemLog(msg)
end

--- Outputs a message to the log at info level, equivalent to Lua builtin `print`.
---@param ... any
function lstg.Print(...)
end

--------------------------------------------------------------------------------

--- Window Initialization Methods
--- All of these only work inside the `launch` file.

--- > Window initialization method, only works in the `launch` file.
---
--- Sets if the game is windowed or not.
---@param windowed boolean `true` => windowed, `false` => fullscreen.
function lstg.SetWindowed(windowed)
end

--- > Window initialization method, only works in the `launch` file.
---
--- Enables or disables Vsync.
---@param Vsync boolean
function lstg.SetVsync(Vsync)
end

--- > Window initialization method, only works in the `launch` file.
---
--- Sets the window resolution and refresh rate.
--- If you want to use fullscreen, it is best to use a set of values defined in `lstg.EnumResolutions()`
---@param width number
---@param height number
---@param refresh_rate_numerator number
---@param refresh_rate_denominator number
---@overload fun(width:number, height:number)
function lstg.SetResolution(width, height, refresh_rate_numerator, refresh_rate_denominator)
end

--- > Window initialization method, only works in the `launch` file.
---
--- Sets the graphics card used by the engine, cannot be changed at runtime.
---@param gpu string
---@param dGPU_trick boolean Puts NVIDIA and AMD GPUs first in line to be selected, to fix a bug on laptops.
function lstg.SetPreferenceGPU(gpu, dGPU_trick)
end

--------------------------------------------------------------------------------

--- Window and Display Settings

--- Sets the game's maximum FPS.
--- Does not go over 60 FPS.
---@param FPSlimit number
function lstg.SetFPS(FPSlimit)
end

---@return number
function lstg.GetFPS()
end

--- Sets if the mouse pointer is shown.
---@param show boolean
function lstg.SetSplash(show)
end

---@param windowtitle string
function lstg.SetTitle(windowtitle)
end

--- Returns the list of supported display modes.
---
--- New in LuaSTG Sub v0.15.6.
---@return integer[][] @{ width, height, refresh_rate_numerator, refresh_rate_denominator }[]
function lstg.EnumResolutions()
end

--- Lists the available graphics cards.
---
--- New in LuaSTG Sub v0.11.0.
---@return string[] @Example: { "Intel XXXX", "NVIDIA YYYY", "AMD ZZZZ" }
function lstg.EnumGPUs()
end

--- Changes the display mode during runtime.  
--- If you want to use fullscreen, it is best to use a set of values defined in `lstg.EnumResolutions()`.  
--- If you don't specify a refresh rate, LuaSTG will try to pick one as close to 60Hz as possible.
---
--- Changed in LuaSTG Sub.
---@param width number
---@param height number
---@param windowed boolean `true` => windowed, `false` => fullscreen.
---@param vsync boolean
---@param refresh_rate_numerator number|nil
---@param refresh_rate_denominator number|nil
---@return boolean @Whether the operation succeeded.
function lstg.ChangeVideoMode(width, height, windowed, vsync, refresh_rate_numerator, refresh_rate_denominator)
end

--------------------------------------------------------------------------------

--- Resource Management

--- Equivalent to `dofile()`, except for an additional optional archive path to search in.  
--- Does not do any of the module checking that `require()` does.
---@param path string
---@param archivefile string|nil
---@return any
function lstg.DoFile(path, archivefile)
end

--- Reads all contents from the specified file and return it as a string.
---@param path string
---@param archivepath string|nil
---@return string
function lstg.LoadTextFile(path, archivepath)
end

--- Loads an archive.
---@param path string
---@param password string|nil
function lstg.LoadPack(path, password)
end

--- Unloads an archive.
---@param path string Same as the path passed to `lstg.LoadPack()`.
function lstg.UnloadPack(path)
end

--- Copies the source file to the destination.
---@param src string Source file path, can be in an archive.
---@param dest string Destination path.
function lstg.ExtractRes(src, dest)
end

--- Lists the files in a certain directory, searches archives as well.
--- If the file is in an archive, the second element of its corresponding table will be the name of the archive.
---@param searchpath string
---@param extendname string|nil File extension to search.
---@param packname string|nil Search in this archive exclusively.
---@return { [1]: string, [2]: string|nil }[] @Filename and the archive it's in (or nil)
function lstg.FindFiles(searchpath, extendname, packname)
end
