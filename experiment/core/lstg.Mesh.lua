---@meta
--- LuaSTG Sub Experimental Documentation: Meshes
--------------------------------------------------------------------------------

---@class lstg.Mesh
local M

---@param vertex_count number
---@param index_count number
function M:resize(vertex_count, index_count)
end

---@return number
function M:getVertexCount()
end

---@return number
function M:getIndexCount()
end

---@param color lstg.Color
function M:setAllVertexColor(color)
end

--- Sets an index to a specified vertex.  
--- 3 indices = one triangle, so multiply the amount of quads in your mesh by
--- 6 and you'll get the amount of indices in your mesh.  
---@param d_idx number Draw index of the vertex, starts at 0.
---@param v_idx number Vertex index, starts at 0.
function M:setIndex(d_idx, v_idx)
end

--- Sets a vertex.  
---@param v_idx number Vertex index, starts at 0.
---@param x number
---@param y number
---@param z number
---@param u number Normalized (between left = 0.0 and right = 1.0)
---@param v number Normalized (between top = 0.0 and bottom = 1.0)
---@param color lstg.Color
function M:setVertex(v_idx, x, y, z, u, v, color)
end

--- Sets the vertex coordinates in the render space.  
---@param v_idx number Vertex index, starts at 0.
---@param x number
---@param y number
---@param z number
function M:setVertexPosition(v_idx, x, y, z)
end

--- Sets the vertex source coordinates.
---@param v_idx number Vertex index, starts at 0.
---@param u number Normalized (between left = 0.0 and right = 1.0)
---@param v number Normalized (between top = 0.0 and bottom = 1.0)
function M:setVertexCoords(v_idx, u, v)
end

--- Sets the vertex color. 
---@param v_idx number Vertex index, starts at 0.
---@param color lstg.Color
function M:setVertexColor(v_idx, color)
end

---@param vertex_count number
---@param index_count number
---@return lstg.Mesh
function lstg.MeshData(vertex_count, index_count)
end
