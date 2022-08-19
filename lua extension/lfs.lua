---@meta
--- LuaSTG Sub Extension Documentation: Lua File System
--------------------------------------------------------------------------------
--- For overloading functions
---@diagnostic disable:duplicate-set-field

---@class lfs
local M = {}
lfs = M

---@class lfs.attribute
---
--- on Unix systems, this represents the device that the inode resides on.  
--- On Windows systems, represents the drive number of the disk containing the file.
---@field dev integer
---
--- on Unix systems, this represents the inode number.  
--- On Windows systems this has no meaning.
---@field ino integer
---
--- String representing the associated protection mode.  
--- The value could be "file", "directory", "link", "socket", "named pipe", "char device", "block device" or "other".
---@field mode string
---
--- The number of hard links to the file.
---@field nlink integer
---
--- user-id of owner (Unix only, always 0 on Windows).
---@field uid integer
---
--- group-id of owner (Unix only, always 0 on Windows).
---@field gid integer
---
--- on Unix systems, represents the device type, for special file inodes.
--- On Windows systems represents the same as dev
---@field rdev integer
---
--- Timestamp of the last access. `os.time` format.
---@field access integer
---
--- Timestamp of the last data modification. `os.time` format.
---@field modification integer
---
--- Timestamp of the last file status change. `os.time` format.
---@field change integer
---
--- File size, in bytes.
---@field size integer
---
--- File permissions string.
---@field permissions string
---
--- Blocks allocated for file. (Unix only)
---@field blocks integer
---
--- Optimal file system I/O blocksize. (Unix only)
---@field blksize integer

---@alias lfs.attribute.key
---| "dev"
---| "ino"
---| "mode"
---| "nlink"
---| "uid"
---| "gid"
---| "rdev"
---| "access"
---| "modification"
---| "change"
---| "size"
---| "permissions"
---| "blocks"
---| "blksize"

--- Returns the value of the named attribute
--- (or nil followed by an error message and a system-dependent error code in case of error).
--- This use is equivalent to `lfs.attributes(filepath)[attr]`.
---@param path string
---@param attr lfs.attribute.key
---@return number|string|nil, string|nil, number|nil @Value, error message, error code.
function M.attributes(path, attr)
end

--- Fills in and returns the table passed in with the file attributes corresponding to filepath
--- (or nil followed by an error message and a system-dependent error code in case of error).
---@param path string
---@param attr lfs.attribute
---@return lfs.attribute|nil, string|nil, number|nil @Table, error message, error code.
function M.attributes(path, attr)
end

--- Returns a table with the file attributes corresponding to filepath
--- (or nil followed by an error message and a system-dependent error code in case of error).
---@param path string
---@return lfs.attribute|nil, string|nil, number|nil @Table, error message, error code.
function M.attributes(path)
end

--- Changes the current working directory to the given path.
---@param path string
---@return boolean, string|nil @Success value, error message
function M.chdir(path)
end

--- Returns a string with the current working directory or nil plus an error string.
---@return string|nil, string|string @Value, error message
function M.currentdir()
end

--- Lua iterator over the entries of a given directory.
--- Each time the iterator is called with dir_obj it returns a directory entry's name as a string,
--- or nil if there are no more entries.
--- You can also iterate by calling dir_obj:next(),
--- and explicitly close the directory before the iteration finished with dir_obj:close().
--- Raises an error if path is not a directory.
---@param path string
---@return fun(t:userdata): string, userdata
function M.dir(path)
end

--- Creates a new directory. The argument is the name of the new directory.
--- Returns true in case of success or nil, an error message and a system-dependent error code in case of error.
---@param path string
---@return boolean, string|nil, number|nil @Success value, error message, error code.
function M.mkdir(path)
end

--- Removes an existing directory. The argument is the name of the directory.
--- Returns true in case of success or nil, an error message and a system-dependent error code in case of error.
---@param path string
---@return boolean, string|nil, number|nil @Success value, error message, error code.
function M.rmdir(path)
end

return M
