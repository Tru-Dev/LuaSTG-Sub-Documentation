---@meta
--- LuaSTG Sub Documentation: Curvy Laser (BentLaserData)
--------------------------------------------------------------------------------
--- For overloading functions
---@diagnostic disable:duplicate-set-field

---@class lstg.CurveLaser
local M = {}

--- Create a curvy laser.
--- Don't worry about the function name, it's a long story.
---@return lstg.CurveLaser
function lstg.BentLaserData()
end

--------------------------------------------------------------------------------

--- Laser frame functions

--- Update the curvy laser with a new node, specifying a maximum length.  
--- Oldest nodes get culled if the node_count is reached.
---@param x number
---@param y number
---@param rot number
---@param node_count integer The maximum amount of nodes in the curved laser (between 2 and 512).
---@param width number The width of the new node.
function M:Update(x, y, rot, node_count, width)
end

--- Update the curvy laser with a new node, specifying a maximum length.  
--- Oldest nodes get culled if the node_count is reached.
---@param unit lstg.GameObject Specifies x, y, and rotation.
---@param node_count integer The maximum amount of nodes in the curved laser (between 2 and 512).
---@param width number The width of the new node.
function M:Update(unit, node_count, width)
end

--- Update a single node in the curvy laser.  
---
--- If you want to update the whole curvy laser, you may want to call `UpdateAllNode` instead.  
--- Doing otherwise may harm performance, as this function causes
--- a recalculation of adjacent nodes.  
---
--- This method is not necessary for implementing traditional curvy lasers, but
--- it may be useful for rendering an image as a circle, curve, or ribbon.
---@param node_index integer Lua-style index, starts from 1
---@param x number
---@param y number
---@param width number
function M:UpdateNode(node_index, x, y, width)
end

--- Sets all the nodes in the curvy laser.  
---
--- The purpose of this method, as opposed to `UpdateNode`,
--- is to reduce the performance impact of updating nodes.  
---
--- This method is not necessary for implementing traditional curvy lasers, but
--- it may be useful for rendering an image as a circle, curve, or ribbon.
---@param node_count integer The total amount of nodes.
---@param x number[]
---@param y number[]
---@param width number|number[] If it's a single number, all nodes are set to this width.
function M:UpdateAllNode(node_count, x, y, width)
end

--- Returns true if the laser still has any nodes in bounds.
---@return boolean
function M:BoundCheck()
end

--- Determines if the curvy laser collides with the parameters specified.
---@param x number
---@param y number
---@param rot number
---@param a number
---@param b number
---@param rect boolean
---@return boolean
function M:CollisionCheck(x, y, rot, a, b, rect)
end

--- Same as `CollisionCheck`, but with an additional laser width parameter.
---@param x number
---@param y number
---@param rot number
---@param a number
---@param b number
---@param rect boolean
---@param width number
---@return boolean
function M:CollisionCheckWidth(x, y, rot, a, b, rect, width)
end

--- Sets the width of all nodes in the curvy laser.
---@param width number
function M:SetAllWidth(width)
end

--- Invalidates the curvy laser object. Do not refer to it after this is called.
function M:Release()
end

--------------------------------------------------------------------------------

--- Laser render functions

--- Render the curvy laser as the texture specified.  
--- The parameters starting with `uv_` refer to which part of the texture to render.
---@param texture string
---@param blendmode lstg.BlendMode
---@param color lstg.Color
---@param uv_left number
---@param uv_top number
---@param uv_width number
---@param uv_height number
---@param scale number
function M:Render(texture, blendmode, color, uv_left, uv_top, uv_width, uv_height, scale)
end

--- Render the collision area of the laser (usually just for debugging)
---@param color lstg.Color
function M:RenderCollider(color)
end

--------------------------------------------------------------------------------

--- Deprecated APIs (either difficult to use or just discouaged)

--- Samples the curvy laser with equal spatial lengths.
---@param length number
---@return { x: number, y:number, rot:number }[]
---@deprecated
function M:SampleByLength(length)
end

--- Samples the curvy laser with equal lengths in frame time.
---@param time number Value in frames
---@return { x: number, y:number, rot:number }[]
---@deprecated
function M:SampleByTime(time)
end

--- ### This overload is deprecated. Please use the other version of this function.  
--- Update a single node in the curvy laser.  
--- 
--- If you want to update the whole curvy laser, you may want to call `UpdateAllNode` instead.  
--- Doing otherwise may harm performance, as this function causes
--- a recalculation of adjacent nodes.  
---@param unit lstg.GameObject Specifies x, y, and rotation.
---@param index number Unlike the other version of this function, it takes an index starting at 0.
---@param length number Unused argument, but it needs to be greater than 1.
---@param width number Unused argument.
---@param active boolean Whether the node is active or not.
---@deprecated
function M:UpdateNode(unit, index, length, width, active)
end

--- Update the position of a curvy laser based on a table of objects.
---@param units lstg.GameObject[]|{ x: number, y: number }[] Up to 512 elements
---@param length number The length of the first parameter.
---@param width number
---@param index number Index of the initial postition
---@param revert boolean Index in reverse
---@deprecated
function M:UpdatePositionByList(units, length, width, index, revert)
end
