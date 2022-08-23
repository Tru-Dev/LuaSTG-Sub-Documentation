---@meta
--- LuaSTG Sub Documentation: Resource Management
--------------------------------------------------------------------------------

--- Resource pool management

---@alias lstg.ResourcePoolType '"none"' | '"global"' | '"stage"'

--- Whether or not to log loaded resources, true by default.  
---
--- Added in LuaSTG Sub.
---@param b boolean
function lstg.SetResLoadInfo(b)
end

--- Switches the active resource pool.  
--- LuaSTG provides 2 resource pools to store game resources.  
--- The active pool has highest priority when loading resources.  
---@param respool lstg.ResourcePoolType
function lstg.SetResourceStatus(respool)
end

--- Returns the currently active resource pool.  
---If the return value is `"none"` it means that *the engine isn't done loading*.
---@return lstg.ResourcePoolType
function lstg.GetResourceStatus()
end

---@alias lstg.ResourceType
---| 1 # tex: texture
---| 2 # img: image (sprite)  
---| 3 # ani: animation (sprite sequence)  
---| 4 # bgm: music  
---| 5 # snd: sound effect  
---| 6 # ps : HGE particle system  
---| 7 # fnt: HGE sprite font  
---| 8 # ttf: truetype font  
---| 9 # fx : Direct3D 11 PixelShader  

--- Empties the specified resource pool. 
---@param respool lstg.ResourcePoolType
function lstg.RemoveResource(respool)
end

--- Removes the specified resource from the pool.
---@param respool lstg.ResourcePoolType
---@param restype lstg.ResourceType
---@param resname string
function lstg.RemoveResource(respool, restype, resname)
end

--- Determine which resource pool a resource is in, returns nil when the resource is not found.
---@param restype lstg.ResourceType
---@param resname string
---@return lstg.ResourcePoolType|nil
function lstg.CheckRes(restype, resname)
end

--- Lists the resources of a specific type, in the global and stage resource pools.
---@param restype lstg.ResourceType
---@return string[], string[] @`"global"`, `"stage"`
function lstg.EnumRes(restype)
end

--- Set sprite (image) rendering scale, defaults to 1.0.  
--- Affects rendering of that sprite only.
---
--- Changed in LuaSTG Sub v0.15.1.
---@param imgname string
---@param scale number
function lstg.SetImageScale(imgname, scale)
end

--- Set global image rendering scale, defaults to 1.0.  
--- Similar to the Units per Pixel setting of some game engines.  
--- When the global scaling is set:  
--- * Affects the scaling of sprites, sprite sequences (animation), HGE particle effects,
---   HGE texture fonts, and truetype fonts when rendered.  
--- * Affects curve laser (bent laser) width  
--- * Affects the collision box size that is automatically set when modifying the game object's `img` property.
---
--- Changed in LuaSTG Sub v0.15.1.
---@param scale number
function lstg.SetImageScale(scale)
end

--- Gets the sprite (image) rendering scale.
---
--- Changed in LuaSTG Sub v0.15.1.
---@param imgname string
---@return number
function lstg.GetImageScale(imgname)
end

--- Gets the global rendering scale.
---
--- Changed in LuaSTG Sub v0.15.1.
---@return number
function lstg.GetImageScale()
end

--- Sets the rendering scale of the specified sprite sequence (animation).  
---
--- Added in LuaSTG Sub v0.15.1.  
---@param aniname string
---@param scale number
function lstg.SetAnimationScale(aniname, scale)
end

--- Gets the rendering scale of the specified sprite sequence (animation).  
---
--- Added in LuaSTG Sub v0.15.1.  
---@return number
function lstg.GetAnimationScale(aniname)
end

--------------------------------------------------------------------------------

--- Textures and render targets

--- Loads a texture from a file.
---@param texname string
---@param filepath string
---@param mipmap boolean|nil Defaults to false.
function lstg.LoadTexture(texname, filepath, mipmap)
end

--- Creates a render target.  
--- When no width and height parameters are specified, the render target is created at window size
--- and resizes automatically.  
--- When width and height are specified, the render target is not automatically resized, and an additional
--- depth and stencil buffer are created at that size.
---
--- Changed in LuaSTG Sub.
---@param rtname string
---@param width number
---@param height number
---@overload fun(rtname:string)
function lstg.CreateRenderTarget(rtname, width, height)
end

--- May be removed in the future.
---@param name string
function lstg.IsRenderTarget(name)
end

---@param texname string Can be a render target.
---@return number, number
function lstg.GetTextureSize(texname)
end

--- Save texture or render target as a JPEG.
---@param texname string
---@param saveto string
function lstg.SaveTexture(texname, saveto)
end

--- Captures the game screen and saves it as a JPEG.
---@param saveto string
function lstg.Snapshot(saveto)
end

--------------------------------------------------------------------------------

--- Image sprites

--- Loads an image sprite from a texture.  
--- XY and width/height are in pixels, origin at top left.  
--- You can specify additional `a`, `b`, and `rect` parameters for game objects.  
--- Providing them will apply those parameters to a game object when setting its `img` property.
---@param imgname string
---@param texname string
---@param x number
---@param y number
---@param width number
---@param height number
---@param a number|nil
---@param b number|nil
---@param rect boolean|nil
---@overload fun(resname:string, texres:string, x:number, y:number, width:number, height:number)
function lstg.LoadImage(imgname, texname, x, y, width, height, a, b, rect)
end

--- Changes the blendmode and vertex color used for rendering the image.  
--- If four colors are provided, sets the color for each vertex.
---@param imgname string
---@param blendmode lstg.BlendMode
---@param color lstg.Color Vertex color
---@overload fun(imgname:string, blendmode:lstg.BlendMode, c1:lstg.Color, c2:lstg.Color, c3:lstg.Color, c4:lstg.Color)
function lstg.SetImageState(imgname, blendmode, color)
end

--- Sets the image's center used when rendering. `x` and `y` are in pixels.  
--- Defaults to the actual center of the image.
---@param imgname string
---@param x number
---@param y number
function lstg.SetImageCenter(imgname, x, y)
end

--- Loads an animaton from a texture.  
--- XY and width/height are in pixels, origin at top left.  
--- You can specify additional `a`, `b`, and `rect` parameters for game objects.  
--- Providing them will apply those parameters to a game object when setting its `img` property.
---@param aniname string
---@param texname string
---@param x number
---@param y number
---@param width number Width of one cell
---@param height number Height of one cell
---@param col number Number of columns
---@param row number Number of rows
---@param aniv number Animation interval (next cell every `aniv` frames)
---@param a number
---@param b number
---@param rect boolean
---@overload fun(resname:string, texres:string, x:number, y:number, width:number, height:number, col:number, row:number, aniv:number)
function lstg.LoadAnimation(aniname, texname, x, y, width, height, col, row, aniv, a, b, rect)
end

--- Changes the blendmode and vertex color used for rendering the animation.  
--- If four colors are provided, sets the color for each vertex.
---@param aniname string
---@param blendmode lstg.BlendMode
---@param color lstg.Color @顶点颜色
---@overload fun(aniname:string, blendmode:lstg.BlendMode, c1:lstg.Color, c2:lstg.Color, c3:lstg.Color, c4:lstg.Color)
function lstg.SetAnimationState(aniname, blendmode, color)
end

--- Sets the animation's center used when rendering. `x` and `y` are in pixels.  
--- Defaults to the actual center of an animation cel.
---@param aniname string
---@param x number
---@param y number
function lstg.SetAnimationCenter(aniname, x, y)
end

--------------------------------------------------------------------------------

--- Particle effects

--- Loads an HGE particle effect from a file.
--- The a, b, and rect parameters only affect a bound game object and should not be used.
---@param psname string
---@param filepath string
---@param imgname string @粒子使用的图片精灵
---@overload fun(psname:string, filepath:string, imgname:string, a:number, b:number, rect:number)
function lstg.LoadPS(psname, filepath, imgname)
end

--------------------------------------------------------------------------------

--- Fonts

--- Loads the HGE texture font from a file.
--- THe font texture image must be stored in the same directory as the font definition file.
---@param fntname string
---@param filepath string
---@param mipmap boolean|nil Defaults to true
function lstg.LoadFont(fntname, filepath, mipmap)
end

--- Sets the blend mode and vertex color used for HGE texture font rendering.
---@param fntname string
---@param blendmode lstg.BlendMode
---@param color lstg.Color
function lstg.SetFontState(fntname, blendmode, color)
end

--- Loads a truetype font from a file, width and height are in pixels.
---@param ttfname string
---@param filepath string
---@param width number
---@param height number
function lstg.LoadTTF(ttfname, filepath, width, height)
end

--- Preloads the glyphs for all characters in the specified string.
---@param ttfname string
---@param cachestring string
function lstg.CacheTTFString(ttfname, cachestring)
end

--------------------------------------------------------------------------------

--- Audio

--- Loads a sound from file, supports stero, 44100Hz, 16-bit audio in wav and ogg formats.
---@param sndname string
---@param filepath string
function lstg.LoadSound(sndname, filepath)
end

--- Loads music from file, supports stero, 44100Hz, 16-bit audio in wav and ogg formats.
--- Supports setting a loop section.
---@param bgmname string
---@param filepath string
---@param loopend number End position of the loop.
---@param looplength number Lenth of the loop.
function lstg.LoadMusic(bgmname, filepath, loopend, looplength)
end

--------------------------------------------------------------------------------

--- Shaders

--- Compiles and loads a Direct3D 11 HLSL shader from file.
---@param fxname string
---@param filepath string
function lstg.LoadFX(fxname, filepath)
end

--------------------------------------------------------------------------------

--- Models

--- Loads a glTF model from file.  
--- Readded in LuaSTG Sub v0.15.0 (with changes).
---@param modname string
---@param gltfpath string
function lstg.LoadModel(modname, gltfpath)
end
