---@meta
--- LuaSTG Sub Documentation: Stopwatch
--------------------------------------------------------------------------------

---@class lstg.StopWatch Timer with millisecond precision
local stopwatch

--- Resets the timer.
function stopwatch:Reset()
end

--- Pauses the timer.
function stopwatch:Pause()
end

--- Resumes the timer.
function stopwatch:Resume()
end

--- Gets the elapsed time in seconds, timer must be resumed in order to get the time correctly
---@return number
function stopwatch:GetElapsed()
end

--- Returns a timer.
--- Note that the timer is started by default.
---@return lstg.StopWatch
function lstg.StopWatch()
end
