---@meta
--- LuaSTG Sub Documentation: File Manager
--------------------------------------------------------------------------------
--- For overloading functions
---@diagnostic disable:duplicate-set-field

--- Compressed Archive class

---@class lstg.Archive
local C = {}

--- Determine if the archive is valid (`UnloadArchive` has not been called on it)
---@return boolean
function C:IsValid()
end

--- Determine if a file exists in the archive
---@param filepath string Path within the archive
---@return boolean
function C:FileExist(filepath)
end

--- Lists all files and folders in the specified path.
---@param searchpath string
---@param extension string|nil If present, match file extension and ignore directories.
---@return { [1]: string, [2]: boolean }[] @Filename and directory status (true if it is a directory).
function C:EnumFiles(searchpath, extension)
end

--- Lists all the files and folders in the archive.
---@return { [1]: string, [2]: boolean }[] @Filename and directory status (true if it is a directory).
function C:ListFiles()
end

--- Gets the archive name (same as the path that was passed to `lstg.FileManager.LoadArchive()`)
---@return string
function C:GetName()
end

--- Gets the priority of the archive.
---@return number
function C:GetPriority()
end

--- Sets the priority of the archive.
---@param priority number
function C:SetPriority(priority)
end

--------------------------------------------------------------------------------

--- File Manager

---@class lstg.FileManager
local M = {}
lstg.FileManager = M

--------------------------------------------------------------------------------

--- Archives

--- Loads a zip archive.
---@param archivefilepath string
---@param priority number|nil Default priority is 0.
---@param password string|nil
---@return lstg.Archive|nil @If it loads successfully, return the archive object, else return null
function M.LoadArchive(archivefilepath, priority, password)
end

--- Unloads an archive.
---@param archivefilepath string The path of the archive, same as the one passed in to `LoadArchive`.
---@return boolean @If true, then the archive was valid and an unloading operation actually occured.
function M.UnloadArchive(archivefilepath)
end

--- Unloads all loaded archives.
function M.UnloadAllArchive()
end

--- Determine if the archive corresponding to the path is loaded.
---@param archivename string The path of the archive, same as the one passed in to `LoadArchive`.
---@return boolean
function M.ArchiveExist(archivename)
end

--- Enumerates over loaded archives.
---@return { [1]: string, [2]: number }[] @Filename and priority.
function M.EnumArchives()
end

--- Retrieves the loaded archive as a `lstg.Archive`.
---@param archivename string The path of the archive, same as the one passed in to `LoadArchive`.
---@return lstg.Archive
function M.GetArchive(archivename)
end

--------------------------------------------------------------------------------

--- Files

--- Check if the file exists.
---@param filepath string
---@param also_check_archive boolean|nil If true, the method also checks if any archive contains the specified file.
---@return boolean
function M.FileExist(filepath, also_check_archive)
end

---@deprecated
function M.FileExistEx(filepath)
end

--- List files and directories under search path.
---@param searchpath string
---@param extend string|nil If present, the method ignores directories and matches the file extension name.
---@param also_enum_archives boolean|nil If true, the method also lists files in loaded archives.
---@return { [1]: string, [2]: boolean }[] @Filename and directory status (true if it is a directory).
function M.EnumFiles(searchpath, extend, also_enum_archives)
end

---@deprecated
function M.EnumFilesEx(searchpath, extend)
end

--------------------------------------------------------------------------------

--- Search path management
--- The engine will look in the search paths when loading Lua scripts and resource files.

--- Adds a search path.
---@param search_path string
function M.AddSearchPath(search_path)
end

--- Removes a search path.
---@param search_path string
function M.RemoveSearchPath(search_path)
end

--- Remove all search paths.
function M.ClearSearchPath()
end

--------------------------------------------------------------------------------

--- Directory management (does not affect archives)

--- Changes the current working directory.
---@param dirpath string
---@return boolean @If the operation succeeded, return true.
function M.SetCurrentDirectory(dirpath)
end

--- Gets the current working directory.
---@return string|nil @If the operation succeeded, return the path, otherwise nil.
function M.GetCurrentDirectory()
end

--- Create directories for every element of dirs that does not already exist.
---@param dirs string
---@return boolean
function M.CreateDirectory(dirs)
end

--- Deletes a directory recursively (includes files and subdirectories)
---@param path string
---@return boolean
function M.RemoveDirectory(path)
end

--- Check if the directory exists.
---@param path string
---@param also_check_archive boolean|nil If true, the method also checks if any archive contains the specified directory.
---@return boolean
function M.DirectoryExist(path, also_check_archive)
end

return M
