---@meta
--- LuaSTG Sub Extension Documentation: JSON Parsing
--------------------------------------------------------------------------------

---@class cjson JSON parsing.
local M
cjson = M

---@class cjson.null
local V = nil
M.null = V

---@return cjson
function M.new()
end

---@param v any
---@return string
function M.encode(v)
end

---@param v string
---@return any
function M.decode(v)
end

--- Determines parsing for invalid numbers such as infinity, NaN, and hex.  
--- When set to true, allow this parsing, else throw an error if these cases are encountered.
---@param b boolean|nil Default is true.
---@return boolean @Always returns the current settings.
function M.decode_invalid_numbers(b)
end

--- Determines how invalid numbers (infinity and NaN) are handled when encoding.  
--- If set to true, encodes invalid numbers. If set to "null", encode invalid numbers as JSON null.  
--- If false, throw an error when trying to encode an invalid number.
---@param b boolean|"null"|nil Default is false.
---@return boolean @Always returns the current settings.
function M.encode_invalid_numbers(b)
end

--- Improves performance by reusing the encoding buffer.  
--- May use more memory.
---@param keep boolean|nil Default is true.
---@return boolean @Always returns the current settings.
function M.encode_keep_buffer(keep)
end

--- Determines when to throw an error when encoding very deep Lua tables.
---@param depth number|nil Default is 1000.
---@return number @Always returns the current settings.
function M.encode_max_depth(depth)
end

--- Determines when to throw an error when parsing very deep JSON objects.
---@param depth number|nil Default is 1000.
---@return number @Always returns the current settings.
function M.decode_max_depth(depth)
end

--- Determines handling of sparse arrays (tables with embedded nil values in their numeric indicies).  
--- By default, will refuse encoding of excessively sparse arrays.  
--- By default, an excessively sparse array is where the largest index
--- is greater than 10 (`safe`) and more than half of the values are `nil` (`1 / ratio`).  
--- If `convert` is true, then accept sparse arrays and encode them as JSON objects instead of arrays.
---@param convert boolean|nil Default is false.
---@param ratio number|nil Default is 2.
---@param safe number|nil Default is 10.
---@return boolean, number, number @Always returns the current settings.
function M.encode_sparse_array(convert, ratio, safe)
end

--- Sets the default encoding precison when encoding numbers.
---@param precision number From 1 to 14, default is 14.
---@return number @Always returns the current settings.
function M.encode_number_precision(precision)
end

---@class cjson.safe Wraps `cjson` methods in a pcall.
local S
M.safe = S

---@return cjson.safe
function S.new()
end

--- Tries to encode the value, but does not throw an error on failure.  
--- If it fails, the normal first return is nil, and the second return is the error message.
---@param v any
---@return string|nil, string|nil @Result, error
function S.encode(v)
end

--- Tries to decode the string, but does not throw an error on failure.  
--- If it fails, the normal first return is nil, and the second return is the error message.
---@param v string
---@return any, string|nil @Result, error
function S.decode(v)
end

return M
