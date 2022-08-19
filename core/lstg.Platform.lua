---@meta
--- LuaSTG Sub Documentation: Platform Operations
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--- Win32 API

--- Executes an external program.
---
--- Warning: Use with caution, may be killed by antivirus software.
--- Note: this function may be removed in the future and made available as part of a
---     Windows platform extension API.
---@param path string
---@param arg string|nil Defaults to no arguments.
---@param workingdir string|nil Defaults to the current directory.
---@param wait boolean|nil Defaults to `true`
---@param show boolean|nil Defaults to `true`
---@return boolean
function lstg.Execute(path, arg, workingdir, wait, show)
end

--- Note: this function may be removed in the future and made available as part of a
---     Windows platform extension API.
---@param title string
---@param text string
---@param flags number
---@return number
function lstg.MessageBox(title, text, flags)
end
