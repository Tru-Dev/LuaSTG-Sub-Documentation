---@meta
--- LuaSTG Sub Documentation: Audio System
--------------------------------------------------------------------------------

--- Migration guide:  
--- Setting the global sound effect and music volume works for playing audio now.  
--- `lstg.UpdateSound` has been removed.

--------------------------------------------------------------------------------

--- Status of an audio resource (sound/bgm)
---@alias lstg.AudioStatus '"playing"' | '"paused"' | '"stopped"'

--------------------------------------------------------------------------------

--- Sound effects

---@param sndname string
---@param volume number Range 0 to 1
---@param pan number Range -1 to 1
function lstg.PlaySound(sndname, volume, pan)
end

---@param sndname string
function lstg.StopSound(sndname)
end

---@param sndname string
function lstg.PauseSound(sndname)
end

---@param sndname string
function lstg.ResumeSound(sndname)
end

---@param sndname string
---@return lstg.AudioStatus
function lstg.GetSoundState(sndname)
end

--- Sets global volume for sound effect resources.
--- Affects playing sounds, unlike previous iterations of LuaSTG.
---@param volume number Range 0 to 1
function lstg.SetSEVolume(volume)
end

--- Sets the volume for a single sound effect resource.
---@param sndname string
---@param volume number Range 0 to 1
function lstg.SetSEVolume(sndname, volume)
end

--------------------------------------------------------------------------------

--- Background music

---@param bgmname string
---@param volume number Range 0 to 1
---@param position number Time from the beginning of the song in seconds.
function lstg.PlayMusic(bgmname, volume, position)
end

---@param bgmname string
function lstg.StopMusic(bgmname)
end

---@param bgmname string
function lstg.PauseMusic(bgmname)
end

---@param bgmname string
function lstg.ResumeMusic(bgmname)
end

---@param bgmname string
---@return lstg.AudioStatus
function lstg.GetMusicState(bgmname)
end

--- Sets global volume for background music resources.
--- Affects playing music, unlike previous iterations of LuaSTG.
---@param volume number Range 0 to 1
function lstg.SetBGMVolume(volume)
end

--- Sets the volume for a single background music resource.
---@param bgmname string
---@param volume number Range 0 to 1
function lstg.SetBGMVolume(bgmname, volume)
end
