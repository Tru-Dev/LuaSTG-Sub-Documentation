---@meta
--- LuaSTG Sub Experimental Documentation: Resource Management
--------------------------------------------------------------------------------

---@alias lstg.KnownSamplerState
---| "" # Equivalent to "linear+clamp".
---| "point+wrap" # No interpolation when upscaling + repeat the texture if UV leaves normal bounds
---| "point+clamp" # No interpolation when upscaling + use border pixels if UV leaves normal bounds
---| "linear+wrap" # Linear interpolation upscaling + repeat the texture if UV leaves normal bounds
---| "linear+clamp" # Linear interpolation upscaling + use border pixels if UV leaves normal bounds

--- Warning: This method existed in previous versions of LuaSTG *by name*, but was
--- different in terms of parameters, behavior, and impact.  
--- It has since been removed.
--- 
--- Sets the sampler used by the texture. 
---@param texture_name string
---@param known_sampler_state lstg.KnownSamplerState
function lstg.SetTextureSamplerState(texture_name, known_sampler_state)
end
