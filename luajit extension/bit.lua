---@meta
--- LuaSTG Sub Extension Documentation: Bitwise Operations (LuaJIT)
--------------------------------------------------------------------------------

---@class bit
local M
bit = M

--- Normalizes a number to the numeric range (32 bit interger) for bit operations and returns it.
---@param x number
---@return number
function M.tobit(x)
end

--- Converts its first argument to a hex string.
--- The number of hex digits is given by the absolute value of the optional second argument.
--- Positive numbers between 1 and 8 generate lowercase hex digits.
--- Negative numbers generate uppercase hex digits.
---@param x number
---@param n number Defaults to 8
---@return string
---@overload fun(x:number):string
function M.tohex(x, n)
end

--- Bitwise not.
---@param x number
---@return number
function M.bnot(x)
end

--- Bitwise and.
---@param x1 number
---@param x2 number
---@param ... number
---@return number
function M.band(x1, x2, ...)
end

--- Bitwise or.
---@param x1 number
---@param x2 number
---@param ... number
---@return number
function M.bor(x1, x2, ...)
end

--- Bitwise xor.
---@param x1 number
---@param x2 number
---@param ... number
---@return number
function M.bxor(x1, x2, ...)
end

--- Bitwise logical left-shift.
---@param x number
---@param n number
---@return number
function M.lshift(x, n)
end

--- Bitwise logical right-shift.
---@param x number
---@param n number
---@return number
function M.rshift(x, n)
end

--- Bitwise arithmetic right-shift.
---@param x number
---@param n number
---@return number
function M.arshift(x, n)
end

--- Bitwise left rotation.
---@param x number
---@param n number
---@return number
function M.rol(x, n)
end

--- Bitwise right rotation.
---@param x number
---@param n number
---@return number
function M.ror(x, n)
end

--- Swaps the bytes of its argument and returns it.
--- This can be used to convert little-endian 32 bit numbers to big-endian 32 bit numbers or vice versa.
---@param x number
---@return number
function M.bswap(x)
end

return M
