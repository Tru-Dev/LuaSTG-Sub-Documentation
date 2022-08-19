---@meta
--- LuaSTG Sub Extension Documentation: Random Number Generation
--------------------------------------------------------------------------------
--- For overloading functions
---@diagnostic disable:duplicate-set-field

--------------------------------------------------------------------------------

--- xoshiro / xoroshiro algorithms => https://prng.di.unimi.it/
--- PCG / jsf / sfc => https://www.pcg-random.org/
--- Lua bindings by Kuanlan

--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

--- Recommended generators:
--- 1. pcg64_oneseq
--- 2. pcg64_fast
--- 3. xoshiro256ss

--------------------------------------------------------------------------------

--- Sample code:
--[[

local random = require("random")
local rng = random.xoshiro256p()

rng:seed(0xFF14)
print(rng:seed())

for _ = 1, 10 do
    print(rng:integer())
end
for _ = 1, 10 do
    print(rng:integer(100))
end
for _ = 1, 10 do
    print(rng:integer(10, 100))
end

for _ = 1, 10 do
    print(rng:number())
end
for _ = 1, 10 do
    print(rng:number(1000.0))
end
for _ = 1, 10 do
    print(rng:integer(100.0, 1000.0))
end

for _ = 1, 10 do
    print(rng:sign)
end

--]]

--------------------------------------------------------------------------------

--- Generator API

---@class random.generator
local C

--- Sets the seed.
---@param value integer
function C:seed(value) end

--- Gets the seed.
function C:seed() end

--- Generates an integer value between 0 and the maximum value of lua_Integer.
---@return integer
function C:integer() end

--- Generates an integer value between 0 and `max`.
---@param max integer
---@return integer
function C:integer(max) end

--- Generates an integer value between `min` and `max`.
---@param min integer
---@param max integer
---@return integer
function C:integer(min, max) end

--- Generates a float value between 0.0 and 1.0.
---@return integer
function C:number() end

--- Generates a float value between 0.0 and `max`.
---@param max number
---@return number
function C:number(max) end

--- Generates a float value between `min` and `max`.
---@param min number
---@param max number
---@return number
function C:number(min, max) end

--- Returns either -1 or 1.
---@return -1|1
function C:sign() end

--------------------------------------------------------------------------------

--- random library

---@class random
local M

---------- splitmix family ----------

---@class random.splitmix64 : random.generator

--- splitmix64  
--- internal state: 64bits  
--- output result: 64bits  
--- it is used for seeding by other random number generators  
--- not recommended for direct use  
---@return random.splitmix64
function M.splitmix64() end

---------- xoshiro128 family ----------

---@class random.xoshiro128p : random.generator

--- xoshiro128 family: xoshiro128+  
--- internal state: 128bits  
--- output result: 32bits  
--- not recommended  
--- only recommended for generating float value  
---@return random.xoshiro128p
function M.xoshiro128p() end

---@class random.xoshiro128pp : random.generator

--- xoshiro128 family: xoshiro128++  
--- internal state: 128bits  
--- output result: 32bits  
--- not recommended  
---@return random.xoshiro128pp
function M.xoshiro128pp() end

---@class random.xoshiro128ss : random.generator

--- xoshiro128 family: xoshiro128**  
--- internal state: 128bits  
--- output result: 32bits  
--- not recommended  
---@return random.xoshiro128ss
function M.xoshiro128ss() end

---------- xoroshiro128 family ----------

---@class random.xoroshiro128p : random.generator

--- xoroshiro128 family: xoroshiro128+  
--- internal state: 128bits  
--- output result: 64bits  
--- not recommended  
---@return random.xoroshiro128p
function M.xoroshiro128p() end

---@class random.xoroshiro128pp : random.generator

--- xoroshiro128 family: xoroshiro128++  
--- internal state: 128bits  
--- output result: 64bits  
---@return random.xoroshiro128pp
function M.xoroshiro128pp() end

---@class random.xoroshiro128ss : random.generator

--- xoroshiro128 family: xoroshiro128**  
--- internal state: 128bits  
--- output result: 64bits  
---@return random.xoroshiro128ss
function M.xoroshiro128ss() end

---------- xoshiro256 family ----------

---@class random.xoshiro256p : random.generator

--- xoshiro256 family: xoshiro256+  
--- internal state: 256bits  
--- output result: 64bits  
--- recommended for generating double value  
---@return random.xoshiro256p
function M.xoshiro256p() end

---@class random.xoshiro256pp : random.generator

--- xoshiro256 family: xoshiro256++  
--- internal state: 256bits  
--- output result: 64bits  
---@return random.xoshiro256pp
function M.xoshiro256pp() end

---@class random.xoshiro256ss : random.generator

--- xoshiro256 family: xoshiro256**  
--- internal state: 256bits  
--- output result: 64bits  
--- recommended for Lua  
---@return random.xoshiro256ss
function M.xoshiro256ss() end

---------- xoshiro512 family ----------

---@class random.xoshiro512p : random.generator

--- xoshiro512 family: xoshiro512+  
--- internal state: 512bits  
--- output result: 64bits  
---@return random.xoshiro512p
function M.xoshiro512p() end

---@class random.xoshiro512pp : random.generator

--- xoshiro512 family: xoshiro512++  
--- internal state: 512bits  
--- output result: 64bits  
---@return random.xoshiro512pp
function M.xoshiro512pp() end

---@class random.xoshiro512ss : random.generator

--- xoshiro512 family: xoshiro512**  
--- internal state: 512bits  
--- output result: 64bits  
---@return random.xoshiro512ss
function M.xoshiro512ss() end

---------- xoroshiro1024 family ----------

---@class random.xoroshiro1024s : random.generator

--- xoroshiro1024 family: xoroshiro1024*  
--- internal state: 1024bits  
--- output result: 64bits  
---@return random.xoroshiro1024s
function M.xoroshiro1024s() end

---@class random.xoroshiro1024pp : random.generator

--- xoroshiro1024 family: xoroshiro1024++  
--- internal state: 1024bits  
--- output result: 64bits  
---@return random.xoroshiro1024pp
function M.xoroshiro1024pp() end

---@class random.xoroshiro1024ss : random.generator

--- xoroshiro1024 family: xoroshiro1024**  
--- internal state: 1024bits  
--- output result: 64bits  
---@return random.xoroshiro1024ss
function M.xoroshiro1024ss() end

---------- pcg family ----------

---@class random.pcg32_oneseq : random.generator

--- pcg family: pcg32_oneseq  
--- internal state: 64bits  
--- output result: 32bits  
--- period: 2^64  
---@return random.pcg32_oneseq
function M.pcg32_oneseq() end

---@class random.pcg32_fast : random.generator

--- pcg family: pcg32_fast  
--- internal state: 64bits  
--- output result: 32bits  
--- period: 2^62  
---@return random.pcg32_fast
function M.pcg32_fast() end

---@class random.pcg64_oneseq : random.generator

--- pcg family: pcg64_oneseq  
--- internal state: 128bits  
--- output result: 64bits  
--- period: 2^128  
---@return random.pcg64_oneseq
function M.pcg64_oneseq() end

---@class random.pcg64_fast : random.generator

--- pcg family: pcg64_fast  
--- internal state: 128bits  
--- output result: 64bits  
--- period: 2^126  
---@return random.pcg64_fast
function M.pcg64_fast() end

---------- sfc family ----------

---@class random.sfc32 : random.generator

--- sfc family: sfc32  
--- internal state: 128bits  
--- output result: 32bits  
---@return random.sfc32
function M.sfc32() end

---@class random.sfc64 : random.generator

--- sfc family: sfc64  
--- internal state: 256bits  
--- output result: 64bits  
---@return random.sfc64
function M.sfc64() end

---------- jsf family ----------

---@class random.jsf32 : random.generator

--- jsf family: jsf32  
--- internal state: 128bits  
--- output result: 32bits  
---@return random.jsf32
function M.jsf32() end

---@class random.jsf64 : random.generator

--- jsf family: jsf64  
--- internal state: 256bits  
--- output result: 64bits  
---@return random.jsf64
function M.jsf64() end

return M
