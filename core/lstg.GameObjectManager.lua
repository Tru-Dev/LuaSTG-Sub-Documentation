---@meta
--- LuaSTG Sub Documentation: Game Object Management
--------------------------------------------------------------------------------

--- Game object pool management

--- Gets the total amount of instatiated objects.
---@return integer
function lstg.GetnObj()
end

--- Deletes all objects and releases the resources that are bound to them.
function lstg.ResetPool()
end

--- > **Do not call in a coroutine or object method.**  
---
--- Updates all objects (except for paused objects).  
--- First it updates velocity, then position and rotation (by `omiga` property).  
--- Calls the object's individual frame callback.
--- Also updates the object's particle system, if it exists.
function lstg.ObjFrame()
end

--- > **Do not call in a coroutine or object method.**  
---
--- Renders all objects (except for hidden objects).
--- Affected by `lstg.SetWorldFlag()`.  
--- Objects with a smaller layer will be rendered first.
function lstg.ObjRender()
end

--- > **Do not call in a coroutine or object method.**  
---
--- Checks for objects exiting the area set by `lstg.SetBound()`.  
--- Triggers object deletion on objects found to be outsid this area.
function lstg.BoundCheck()
end

--- Sets the deletion boundary for objects.
--- > Changed in LuaSTG Sub v0.17.0:  
--- > - Default bounds are now -100, 100, -100, 100
--- > - Fixed an issue where bounds were rounded to integer values
---@param left number
---@param right number
---@param bottom number
---@param top number
function lstg.SetBound(left, right, bottom, top)
end

--- > **Do not call in a coroutine or object method.**  
---
--- Tests for collision between 2 collision groups.  
--- Affected by `lstg.ActiveWorlds()`.
--- If a collision occurs, triggers the collision callback for the object in group A, with the
--- `other` parameter being the object in group B.  
---@param groupidA integer Must be between 0 and 15.
---@param groupidB integer Must be between 0 and 15.
function lstg.CollisionCheck(groupidA, groupidB)
end

--- > **Do not call in a coroutine or object method.**  
---
--- Updates dx, dy, and rotation (if `navi` is set to true) for each object.
function lstg.UpdateXY()
end

--- > **Do not call in a coroutine or object method.**  
---
--- Increments objects' `timer` and `ani`.  
--- Frees objects that are marked `"kill"` or `"del"`
function lstg.AfterFrame()
end

--------------------------------------------------------------------------------

--- Individual game object management

--- Instantiate a game object.  
--- Runs the class's object initialization callback.
---@param class lstg.Class
---@param ... any Passed to the initialization callback function.
---@return lstg.GameObject
function lstg.New(class, ...)
end

--- Triggers the deletion callback on the object and sets its status to `"del"`.
---@param unit lstg.GameObject
---@param ... any Passed to the deletion callback function.
function lstg.Del(unit, ...)
end

--- Triggers the kill callback on the object and sets its status to `"kill"`.
---@param unit lstg.GameObject
---@param ... any Passed to the kill callback function.
function lstg.Kill(unit, ...)
end

--- Checks whether the parameter is a valid game object.  
--- A valid game object is anything instantiated through `lstg.New()` and not deleted or killed.
---@param unit any
---@return boolean
function lstg.IsValid(unit)
end

--------------------------------------------------------------------------------

--- Object collision detection

--- Checks if the object is in the specified rectangular area.
---@param unit lstg.GameObject
---@param left number
---@param right number
---@param bottom number
---@param top number
---@return boolean
function lstg.BoxCheck(unit, left, right, bottom, top)
end

--- Checks the collision on 2 objects.
--- Looks at active worlds to check, see `lstg.ActiveWorlds()`.
---@param unitA lstg.GameObject
---@param unitB lstg.GameObject
---@param ignoreworldmask boolean If true, ignores world mask.
---@return boolean
function lstg.ColliCheck(unitA, unitB, ignoreworldmask)
end

---@alias lstg.ObjList.Next fun(groupid:number, objid:number):number, lstg.GameObject

--- Iterates through the specified collision group, or all objects if nil.
---@param groupid integer|nil
---@return lstg.ObjList.Next, number, number
function lstg.ObjList(groupid)
end

--------------------------------------------------------------------------------

--- Game object property access (game object's metamethods)

--- Sets a property on the game object.  
--- Equivalent to the game object's `__newindex` metamethod.
---@param t lstg.GameObject
---@param k number|string
---@param v any
function lstg.SetAttr(t, k, v)
end

--- Gets a property on the game object.  
--- Equivalent to the game object's `__index` metamethod.
---@param t lstg.GameObject
---@param k number|string
---@return any
function lstg.GetAttr(t, k)
end

--------------------------------------------------------------------------------

--- Helper functions

--- Sets the game object's velocity vector.
---@param unit lstg.GameObject
---@param v number Speed value.
---@param a number Angle value.
---@param updaterot boolean If true, set the object's render rotation (`rot` field).
function lstg.SetV(unit, v, a, updaterot)
end

--- Gets the speed and angle of the object.
---@param unit lstg.GameObject
---@return number, number
function lstg.GetV(unit)
end

--- Calculates the angle between two game objects.
---@param a lstg.GameObject
---@param b lstg.GameObject
---@return number
function lstg.Angle(a, b)
end

--- Calculates the angle between a game object and a point.
---@param unit lstg.GameObject
---@param x number
---@param y number
---@return number
function lstg.Angle(unit, x, y)
end

--- Calculates the angle between a point and a game object.
---@param x number
---@param y number
---@param unit lstg.GameObject
---@return number
function lstg.Angle(x, y, unit)
end

--- Calculates the angle between two points.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function lstg.Angle(x1, y1, x2, y2)
end

--- Calculates the distance between two game objects.
---@param a lstg.GameObject
---@param b lstg.GameObject
---@return number
function lstg.Dist(a, b)
end

--- Calculates the distance between a game object and a point.
---@param unit lstg.GameObject
---@param x number
---@param y number
---@return number
function lstg.Dist(unit, x, y)
end

--- Calculates the distance between a point and a game object.
---@param x number
---@param y number
---@param unit lstg.GameObject
---@return number
function lstg.Dist(x, y, unit)
end

--- Calculates the distance between two points.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function lstg.Dist(x1, y1, x2, y2)
end

--------------------------------------------------------------------------------

--- Individual object rendering

--- Sets the blend mode and color of the game object's bound resource.
---@param unit lstg.GameObject
---@param blend lstg.BlendMode
---@param a number Alpha value, clamped between 0 to 255.
---@param r number Red value, clamped between 0 to 255.
---@param g number Green value, clamped between 0 to 255.
---@param b number Blue value, clamped between 0 to 255.
function lstg.SetImgState(unit, blend, a, r, g, b)
end

--- Runs the default render method of the game object
--- (render the object's `img` resource with color, rotation, scale, etc. applied).
---@param unit lstg.GameObject
function lstg.DefaultRenderFunc(unit)
end

--------------------------------------------------------------------------------

--- Game object particle system methods

--- Sets the blend mode and color of a game object's bound particle system.
---@param unit lstg.GameObject
---@param blend lstg.BlendMode
---@param a number Alpha value, clamped between 0 to 255.
---@param r number Red value, clamped between 0 to 255.
---@param g number Green value, clamped between 0 to 255.
---@param b number Blue value, clamped between 0 to 255.
function lstg.SetParState(unit, blend, a, r, g, b)
end

--- Stops the game object's particle emission.
---@param unit lstg.GameObject
function lstg.ParticleStop(unit)
end

--- Starts the game object's particle emission.
---@param unit lstg.GameObject
function lstg.ParticleFire(unit)
end

--- Gets the current amount of particles being emitted from the game object.
---@param unit lstg.GameObject
---@return number
function lstg.ParticleGetn(unit)
end

--- Sets the emission density of the game object's particle emitter.
---@param unit lstg.GameObject
---@param emission number Particles/second
function lstg.ParticleSetEmission(unit, emission)
end

--- Gets the emission density of the game object's particle emitter, in particles per second.
---@param unit lstg.GameObject
---@return number
function lstg.ParticleGetEmission(unit)
end

--------------------------------------------------------------------------------

--- Super pause (advanced feature)  
--- If super pause is set, then it pauses updates of all objects that have `nopause` set to false
--- (which is the default).

--- Sets the pause time in frames, the game will subtract one from this number
--- each frame until it hits 0.  
--- Pausing updates the frame after this is called.
---@param t number
function lstg.SetSuperPause(t)
end

--- Adds to the pause time in frames.
--- Equivalent to `lstg.SetSuperPause(lstg.GetSuperPause() + t)`.
--- Pausing updates the frame after this is called.
---@param t number
function lstg.AddSuperPause(t)
end

--- Gets the amount of frames until super pause ends, scheduled for the next frame
--- (meaning that it updates with `lstg.SetSuperPause()` and `lstg.AddSuperPause()`
--- within the same frame).  
---@return number
function lstg.GetSuperPause()
end

--- Gets the amount of frames until super pause ends,
--- does not update for `lstg.SetSuperPause()` or `lstg.AddSuperPause()` in the current frame.
---@return number
function lstg.GetCurrentSuperPause()
end

--------------------------------------------------------------------------------

--- World mask (advanced feature)

--- Rendering and bound checks only occur on the worlds specified by the current world flag.  
--- There are up to 64 worlds, each represented by a single bit in the mask.
---
--- The world flag set by `lstg.SetWorldFlag()` affects:
--- - `lstg.ObjRender()`: Only renders objects that are in the worlds specified.
--- - `lstg.BoundCheck()`: Only performs checking on objects that are in the worlds specified.
--- - `lstg.DrawGroupCollider()`: Only draws the colliders for objects that are in the worlds specified.
---
--- Example:
--- ```
--- local obj1 = lstg.New(class)
--- obj1.world = 0b1001
--- local obj2 = lstg.New(class)
--- obj2.world = 0b1100
--- -- In FrameFunc:
--- lstg.SetWorldFlag(0b0011)
--- lstg.BoundCheck() -- only checks if obj1 has exited the bounds
--- -- In RenderFunc:
--- lstg.SetWorldFlag(0b0110)
--- lstg.ObjRender() -- Only renders obj2
---
--- -- If lstg.SetWorldFlag(0b1000) had been called instead, both objects would be rendered/boundchecked.
--- ```

--- Sets the current world flag.  
--- See the documentation for `lstg.GameObjectManager` for details on how world flags work.
---@param mask integer
function lstg.SetWorldFlag(mask)
end

--- Gets the current world flag.
---@return number
function lstg.GetWorldFlag()
end

--- Checks if the two world flags share any worlds (does a bitwise and operation on their world flags).
---@param maskA integer
---@param maskB integer
---@return boolean
function lstg.IsInWorld(maskA, maskB)
end

--- Collision checks (`lstg.CollisionCheck()` and `lstg.ColliCheck()`) refer to active worlds instead.  
--- Active worlds refer to the same `world` property on the object, but are stored
--- separately from the main world flag set in `lstg.SetWorldFlag()` internally.
---
--- There can be up to four active world masks. Two flags are checked against the active worlds,
--- then the result of that is checked against each other.  
--- This means that if `lstg.IsInWorld(maskA, aw_mask) and lstg.IsInWorld(maskB, aw_mask)`
--- (where maskA and maskB are inputs to `lstg.IsSameWorld()` and aw_mask is an active world mask)
--- returns true for any active world mask, then `lstg.IsSameWorld()` returns true, and collisions
--- are checked against those two input masks.
---
--- Example:
--- ```
--- local obj1 = lstg.New(class)
--- obj1.world = 0b0001
--- local obj2 = lstg.New(class)
--- obj2.world = 0b0010
--- local obj3 = lstg.New(class)
--- obj3.world = 0b0111
--- lstg.ActiveWorlds(0b0001, 0b0010, 0b0100, 0b1000)
--- print(lstg.IsSameWorld(obj1.world, obj2.world)) -- false, collisions are not checked between obj1 and obj2
--- print(lstg.IsSameWorld(obj1.world, obj3.world)) -- true, collisions are checked between obj1 and obj3
--- print(lstg.IsSameWorld(obj2.world, obj3.world)) -- true, collisions are checked between obj2 and obj3
--- ```

--- Sets the mask for up to 4 worlds, used in `lstg.IsSameWorld()` and `lstg.ColliCheck()`.  
--- Parameters default to 0.
---@param maskA integer|nil
---@param maskB integer|nil
---@param maskC integer|nil
---@param maskD integer|nil
function lstg.ActiveWorlds(maskA, maskB, maskC, maskD)
end

--- Returns true if both masks are in an active world mask (see `lstg.ActiveWorlds()`).
---@param maskA integer
---@param maskB integer
---@return boolean
function lstg.IsSameWorld(maskA, maskB)
end
