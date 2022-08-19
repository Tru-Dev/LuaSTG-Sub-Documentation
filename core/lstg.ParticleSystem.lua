---@meta
--- LuaSTG Sub Documentation: HGE Compatible Particle System
--------------------------------------------------------------------------------

--- Added in LuaSTG Sub v0.17.0.
---@class lstg.ParticleSystem.Vector2
---@field x number
---@field y number

--- Added in LuaSTG Sub v0.17.0.
---@class lstg.ParticleSystem.Color4F
---@field r number
---@field g number
---@field b number
---@field a number

--- Added in LuaSTG Sub v0.17.0.
---@class lstg.ParticleSystem
local C = {}

--------------------------------------------------------------------------------

--- Particle system API

--- Updates the particle system (optionally with new parameters).
---@param dt number Defaults to 1/60 (one frame)
---@param x number|nil
---@param y number|nil
---@param rot number|nil
function C:Update(dt, x, y, rot)
end

---@param scale number
function C:Render(scale)
end

--- Sets old behavior mode, which causes particles to behave as in LuaSTG Plus, Ex Plus, and -x.
---
--- In old behavior mode:  
--- * The emission angle direction defined by the HGE particle effects file psi is ignored.
--- * The `Relative` switch that relates the emission angle to the movement direction
---   is ignored as defined in the HGE particle effects file.
--- 
--- After turning off the old behavior mode:  
--- * The emission angle direction defined by the HGE particle effects file psi is no longer ignored,
---   this angle is added to the rotation parameter (see `lstg.ParticleSystem.setRotation()`).
--- * The `Relative` switch  is no longer ignored, which means the emission angle changes with movement.
---
--- It is not recommended to turn on Relative unless Rotation is always 0.
---
--- By default, old behavior mode is turned on.
---@param enable boolean
function C:SetOldBehavior(enable)
end

--------------------------------------------------------------------------------

--- Extended API, supports dynamic modification of particle system parameters, and is partially
--- compatible with LuaSTG-x.

---@return number
function C:getAliveCount()
end

---@return number
function C:getAlphaVar()
end

---@return lstg.ParticleSystem.Vector2
function C:getCenter()
end

--- Not directly compatible with LuaSTG-x, as there this function returns a `lstg.Color` instead.
---@return lstg.ParticleSystem.Color4F
function C:getColorEnd()
end

--- Not directly compatible with LuaSTG-x, as there this function returns a `lstg.Color` instead.
---@return lstg.ParticleSystem.Color4F
function C:getColorStart()
end

---@return number
function C:getColorVar()
end

--- This property is not used by default, please see `lstg.ParticleSystem.SetOldBehavior` for details.
---@return number
function C:getDirection()
end

---@return number
function C:getEmissionFreq()
end

---@return number
function C:getGravityMax()
end

---@return number
function C:getGravityMin()
end

---@return number
function C:getLifeMax()
end

---@return number
function C:getLifeMin()
end

---@return number
function C:getLifetime()
end

---@return number
function C:getRadialAccelMax()
end

---@return number
function C:getRadialAccelMin()
end

--- This property is not used by default, please see `lstg.ParticleSystem.SetOldBehavior` for details.
---@return boolean
function C:getRelative()
end

--- Not compatible with LuaSTG-x, as there this function returns a `lstg.RenderMode` object.
---@return lstg.BlendMode
function C:getRenderMode()
end

--- Not compatible with LuaSTG-x, as there this function returns a `lstg.ResParticle` object.  
--- LuaSTG does not make an object out of the resource yet, so it can only return its name.
---@return string
function C:getResource()
end

--- By default Rotation overrides the Direction property, please see `lstg.ParticleSystem.SetOldBehavior` for details.
---@return number
function C:getRotation()
end

--- 32-bit unsigned integer RNG seed.
---@return number
function C:getSeed()
end

---@return number
function C:getSizeEnd()
end

---@return number
function C:getSizeStart()
end

---@return number
function C:getSizeVar()
end

---@return number
function C:getSpeedMax()
end

---@return number
function C:getSpeedMin()
end

---@return number
function C:getSpinEnd()
end

---@return number
function C:getSpinStart()
end

---@return number
function C:getSpinVar()
end

---@return number
function C:getSpread()
end

---@return number
function C:getTangentialAccelMax()
end

---@return number
function C:getTangentialAccelMin()
end

---@return boolean
function C:isActive()
end

---@param b boolean
function C:setActive(b)
end

---@param v number
function C:setAlphaVar(v)
end

---@param vec2 lstg.ParticleSystem.Vector2
function C:setCenter(vec2)
end

--- Not directly compatible with LuaSTG-x, as there this function accepts a `lstg.Color` instead.
---@param col4f lstg.ParticleSystem.Color4F
function C:setColorEnd(col4f)
end

--- Not directly compatible with LuaSTG-x, as there this function accepts a `lstg.Color` instead.
---@param col4f lstg.ParticleSystem.Color4F
function C:setColorStart(col4f)
end

---@param v number
function C:setColorVar(v)
end

--- This property is not used by default, please see `lstg.ParticleSystem.SetOldBehavior` for details.
---@param v number
function C:setDirection(v)
end

--- Emission density is in particles/second.
---@param n integer
function C:setEmissionFreq(n)
end

---@param v number
function C:setGravityMax(v)
end

---@param v number
function C:setGravityMin(v)
end

---@param v number
function C:setLifeMax(v)
end

---@param v number
function C:setLifeMin(v)
end

--- Amount of time that the particle system runs upon firing, in seconds.
---@param v number
function C:setLifetime(v)
end

---@param v number
function C:setRadialAccelMax(v)
end

---@param v number
function C:setRadialAccelMin(v)
end

--- This property is not used by default, please see `lstg.ParticleSystem.SetOldBehavior` for details.
---@param b boolean
function C:setRelative(b)
end

--- Not compatible with LuaSTG-x, as there this function accepts a `lstg.RenderMode` instead.
---@param blend lstg.BlendMode
function C:setRenderMode(blend)
end

--- By default Rotation overrides the Direction property, please see `lstg.ParticleSystem.SetOldBehavior` for details.
---@param v number
function C:setRotation(v)
end

--- 32 位无符号整数随机数种子
---@param seed number
function C:setSeed(seed)
end

---@param v number
function C:setSizeEnd(v)
end

---@param v number
function C:setSizeStart(v)
end

---@param v number
function C:setSizeVar(v)
end

---@param v number
function C:setSpeedMax(v)
end

---@param v number
function C:setSpeedMin(v)
end

---@param v number
function C:setSpinEnd(v)
end

---@param v number
function C:setSpinStart(v)
end

---@param v number
function C:setSpinVar(v)
end

---@param v number
function C:setSpread(v)
end

---@param v number
function C:setTangentialAccelMax(v)
end

---@param v number
function C:setTangentialAccelMin(v)
end

--------------------------------------------------------------------------------

--- Create a particle system

--- Creates a particle system instance from the resource `ps_name`.
---@param ps_name string
---@return lstg.ParticleSystem
function lstg.ParticleSystemData(ps_name)
end
