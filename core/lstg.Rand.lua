---@meta
--- LuaSTG Sub Documentation: Random class
--------------------------------------------------------------------------------

--- Uses the WELL512 random number generator.  
--- Use of this module is not recommended anymore, as there is a new RNG library.  
--- You can access it through `local random = require("random")`.

--------------------------------------------------------------------------------

---@class lstg.Rand WELL512 RNG
local R

--- Sets the seed used for the RNG.
---@param seed integer
function R:Seed(seed)
end

--- Gets the current state of the RNG
---@return integer
function R:GetSeed()
end

--- Gets a random integer between n1 and n2.
---@param n1 integer
---@param n2 integer
---@return integer
function R:Int(n1, n2)
end

--- Gets a random decimal number between f1 and f2
---@param f1 number
---@param f2 number
---@return number
function R:Float(f1, f2)
end

--- Return either -1 or 1.
---@return -1|1
function R:Sign()
end

--- Returns a new RNG object.
---@return lstg.Rand
function lstg.Rand()
end
