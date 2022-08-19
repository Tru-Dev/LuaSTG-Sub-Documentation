---@meta
--- LuaSTG Sub Documentation: fancy2d Color
--------------------------------------------------------------------------------
--- For overloading functions
---@diagnostic disable:duplicate-set-field

---@class lstg.Color
---
--- Alpha value, in the range of 0-255.  
--- Setting it to a value outside of that range will cause it to be clamped.
---@field a integer
---
--- Red value, in the range of 0-255.  
--- Setting it to a value outside of that range will cause it to be clamped.
---@field r integer
---
--- Green value, in the range of 0-255.  
--- Setting it to a value outside of that range will cause it to be clamped.
---@field g integer
---
--- Blue value, in the range of 0-255.  
--- Setting it to a value outside of that range will cause it to be clamped.
---@field b integer
---
--- The color represented in 32bit, 0x00000000-0xFFFFFFFF.
---@field argb integer
---
--- The color's hue, in the range of 0-100.  
--- Setting it to a value outside of that range will cause it to be clamped.  
--- Please note that accessing this value may not be precise, as the color is stored in ARGB format.
---@field h number
---
--- The color's saturation, in the range of 0-100.  
--- Setting it to a value outside of that range will cause it to be clamped.  
--- Please note that accessing this value may not be precise, as the color is stored in ARGB format.
---@field s number
---
--- The color's value, in the range of 0-100.  
--- Setting it to a value outside of that range will cause it to be clamped.  
--- Please note that accessing this value may not be precise, as the color is stored in ARGB format.
---@field v number
local Color

--- Return the ARGB components as four ints between 0 and 255.
---@return integer, integer, integer, integer
function Color:ARGB()
end

--- Set the value of the color via RGB.
---@param argb integer The color represented in 32bit, 0x00000000-0xFFFFFFFF
function Color:ARGB(argb)
end

--- Set the value of the color via RGB.
--- The value of each parameter is clamped to 0-255.
---@param alpha integer 
---@param red integer
---@param green integer
---@param blue integer
function Color:ARGB(alpha, red, green, blue)
end

--- Get the value of the color as HSV (4 float values between 0 and 100).
--- Warning: lstg.Color is represented by 4 bytes internally. Loss of precision may occur.
---@return number, number, number, number
function Color:AHSV()
end

--- Set the value of the color via HSV.
--- The value of each parameter is clamped to 0-100.
---@param alpha number
---@param hue number
---@param saturation number
---@param value number
function Color:AHSV(alpha, hue, saturation, value)
end

--- Create a new color via RGB.
--- The value of each parameter is clamped to 0-255.
---@param alpha integer 
---@param red integer
---@param green integer
---@param blue integer
---@return lstg.Color
function lstg.Color(alpha, red, green, blue)
end

--- Create a new color via RGB.
---@param argb integer The color represented in 32bit, 0x00000000-0xFFFFFFFF
---@return lstg.Color
function lstg.Color(argb)
end

--- Set the value of the color via HSV.
--- The value of each parameter is clamped to 0-100.
---@param alpha number
---@param hue number
---@param saturation number
---@param value number
---@return lstg.Color
function lstg.HSVColor(alpha, hue, saturation, value)
end
