---@meta
--- LuaSTG Sub Documentation: Renderer
--------------------------------------------------------------------------------

--- Migration guide:

--- Regarding `lstg.SetScissorRect()`:  
--- LuaSTG Sub enables cropping by default, so make sure you call it with `lstg.SetViewport()`,
--- otherwise problems may occur (you may see a purely black screen).

--- Regarding `lstg.RenderClear()`:  
--- In Direct3D 9, it would only clear the viewport range,
--- which is not in line with current graphics APIs.  
--- Please use `lstg.RenderRect()` to simulate the old behavior.

--- Regarding `lstg.PostEffectCapture()`/`lstg.PostEffectApply()`:  
--- These methods were removed.  
--- Create a render target, and then use `lstg.PostEffect()` instead.

--- Regarding `lstg.SetTextureSamplerState()`:  
--- This method has been removed and readded with a different API, see the file
--- `experiment/lstg.Renderer.lua` for details.

--- Regarding `lstg.RenderModel()` from Ex Plus:  
--- The model type has changed to glTF, and the implementation has changed.

--------------------------------------------------------------------------------

--- Blend modes:

--- Blend modes consist of two parts, vertex color blending and pixel blending.  
--- Vertex color is what is set in `lstg.SetImageState()`, alongside this blend mode.  
--- All blend operations are in the range of 0 to 1, as floats.
--- ```
--- Vertex blending:
---     mul     Vertex ARGB * image ARGB
---     add     Vertex RGB + image RGB, vertex A * image A
--- Pixel blending:
---     alpha   Blends colors according to alpha value.
---     add     Image RGB + target RGB
---     rev     Target RGB - image RGB
---     sub     Image RGB - target RGB
---     min     Renders the color with the lowest value.
---     max     Renders the color with the highest value.
---     mul     Image RGB * target RGB
---     screen  Special blend mode.
--- Miscellaneous blend modes:
---     "one"       Target RGB = image RGB (overwrite)
---     "alpha+bal" Inverts the target RGB dependent on the image value, black = same, white = invert.
--- ```
--- Note: vertex blending does not work with `lstg.PostEffect()`.  
--- You should be able to get around this by wrapping the call to it in another render target, however.

--- Blend mode operation. `v` is vertex color, `i` is image color, and `t` is target color.
---@alias lstg.BlendMode
---| ""             # Equivalent to mul+alpha (= v.rgb * i.rgb and lerp t.rgb based on v.a * i.a)
---| "mul+alpha"    # = v.rgb * i.rgb and lerp to t.rgb based on v.a * i.a
---| "mul+add"      # = (v.rgb * i.rgb) + t.rgb
---| "mul+rev"      # = t.rgb - (v.rgb * i.rgb)
---| "mul+sub"      # = (v.rgb * i.rgb) - t.rgb
---| "add+alpha"    # = v.rgb + i.rgb and lerp to t.rgb based on v.a * i.a
---| "add+add"      # = (v.rgb + i.rgb) + t.rgb
---| "add+rev"      # = t.rgb - (v.rgb + i.rgb)
---| "add+sub"      # = (v.rgb + i.rgb) - t.rgb
---| "alpha+bal"    # = dark = t.rgb, light = 1 - t.rgb
---| "mul+min"      # = min(v.rgb * i.rgb, t.rgb)
---| "mul+max"      # = max(v.rgb * i.rgb, t.rgb)
---| "mul+mul"      # = (v.rgb * i.rgb) * t.rgb
---| "mul+screen"   # = screen(v.rgb * i.rgb, t.rgb)
---| "add+min"      # = min(v.rgb + i.rgb, t.rgb)
---| "add+max"      # = max(v.rgb + i.rgb, t.rgb)
---| "add+mul"      # = (v.rgb + i.rgb) * t.rgb
---| "add+screen"   # = screen(v.rgb + i.rgb, t.rgb)
---| "one"          # = v.argb * i.argb

--------------------------------------------------------------------------------

--- Renderer methods

--- Starts the renderer.
function lstg.BeginScene()
end

--- Finishes rendering and displays updated scene.
function lstg.EndScene()
end

--------------------------------------------------------------------------------

--- Render pipeline methods

--- Sets the fog level.
---@param near number > 0 means linear fog, == -1.0 means exponential fog, == -2.0 means quadratic fog.
---@param far number If fog is linear, this is as far as the fog goes. Else, this means fog density.
---@param color lstg.Color
function lstg.SetFog(near, far, color)
end

--- Disables fog.
function lstg.SetFog()
end

--- Sets the viewport. Origin is bottom left, positive directions are up and right.
---@param left number
---@param right number
---@param bottom number
---@param top number
function lstg.SetViewport(left, right, bottom, top)
end

--- Sets the crop rectangle for rendering. Origin is bottom left, positive directions are up and right.
---
--- Added in LuaSTG Sub.
---@param left number
---@param right number
---@param bottom number
---@param top number
function lstg.SetScissorRect(left, right, bottom, top)
end

--- Sets up the range of render units for the viewport.
---@param left number
---@param right number
---@param bottom number
---@param top number
function lstg.SetOrtho(left, right, bottom, top)
end

--- Sets up a perspective camera.  
--- Warning: `fovy` is in radians.  
--- `x, y, z` parameters set the camera position.  
--- `at` parameters set where the position where the camera is looking.  
--- `up` parameters set which way is up for the camera.
---@param x number
---@param y number
---@param z number
---@param atx number
---@param aty number
---@param atz number
---@param upx number
---@param upy number
---@param upz number
---@param fovy number Vertical field of view, in radians.
---@param aspect number Aspect ratio to render at.
---@param zn number Near plane.
---@param zf number Far plane.
function lstg.SetPerspective(x, y, z, atx, aty, atz, upx, upy, upz, fovy, aspect, zn, zf)
end

--- Controls the depth buffer. 0 = off, 1 = on.
---@param state integer
function lstg.SetZBufferEnable(state)
end

--------------------------------------------------------------------------------

--- Render target methods

--- Clears the render target with the specified color.  
---
--- Changed in LuaSTG Sub.
---@param color lstg.Color
function lstg.RenderClear(color)
end

--- Clear the depth bufffer with the specified depth value, usually 1.0.
---@param depth number
function lstg.ClearZBuffer(depth)
end

-- Render targets are set via a stack to simplify their use.

--- Pushes the specified render target.
---@param rtname string
function lstg.PushRenderTarget(rtname)
end

--- Pops a render target.
function lstg.PopRenderTarget()
end

--------------------------------------------------------------------------------

--- Drawing methods

--- Draws an image in the specified rectangle.
---@param imgname string
---@param left number
---@param right number
---@param bottom number
---@param top number
function lstg.RenderRect(imgname, left, right, bottom, top)
end

--- Draws an image.  
--- Affected by `lstg.SetImageScale()`.
---@param imgname string
---@param x number
---@param y number
---@param rot number|nil Image rotation, 0 if unspecified.
---@param hscale number|nil Image horizontal scale, 1 if unspecified.
---@param vscale number|nil Image vertical scale, 1 if unspecified.
---@param z number|nil
function lstg.Render(imgname, x, y, rot, hscale, vscale, z)
end

--- Draws an animation.  
--- Affected by `lstg.SetImageScale()`.
---@param aniname string
---@param anitimer integer Animation frame.
---@param x number
---@param y number
---@param rot number|nil Image rotation, 0 if unspecified.
---@param hscale number|nil Image horizontal scale, 1 if unspecified.
---@param vscale number|nil Image vertical scale, 1 if unspecified.
---@param z number|nil
function lstg.RenderAnimation(aniname, anitimer, x, y, rot, hscale, vscale, z)
end

--- Specifies 4 vertex positions to draw the image on.
---@param imgname string
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param x3 number
---@param y3 number
---@param z3 number
---@param x4 number
---@param y4 number
---@param z4 number
function lstg.Render4V(imgname, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4)
end

--- Specifies 4 vertices to draw the texture resource on.  
--- Each vertex is specified as { x, y, z, u, v, color }.  
--- UV coordinates are in pixels (not 0.0 to 1.0), the top left is the origin, u increasing to the
--- right, and v increasing downwards.
---@param texname string
---@param blendmode lstg.BlendMode
---@param v1 { [1]: number, [2]: number, [3]: number, [4]: number, [5]: number, [6]: lstg.Color }[]
---@param v2 { [1]: number, [2]: number, [3]: number, [4]: number, [5]: number, [6]: lstg.Color }[]
---@param v3 { [1]: number, [2]: number, [3]: number, [4]: number, [5]: number, [6]: lstg.Color }[]
---@param v4 { [1]: number, [2]: number, [3]: number, [4]: number, [5]: number, [6]: lstg.Color }[]
function lstg.RenderTexture(texname, blendmode, v1, v2, v3, v4)
end

--------------------------------------------------------------------------------

--- Text rendering

---@alias lstg.TextAlignment
---| 0 # Top left.
---| 1 # Top center.
---| 2 # Top right.
---| 4 # Center left.
---| 5 # Fully centered.
---| 6 # Center right.
---| 8 # Bottom left.
---| 9 # Bottom center.
---| 10 # Bottom right.
---| 16 # Disable automatic line feed, useful for Chinese text. Add this to any of the other values.

--- Draws the text with a HGE image font.  
--- Affected by `lstg.SetImageScale()`.
---@param fntname string
---@param text string
---@param x number
---@param y number
---@param scale number
---@param align lstg.TextAlignment
function lstg.RenderText(fntname, text, x, y, scale, align)
end

--- Draws the text with a truetype font.  
--- Note that the scale is automatically halved in the LuaSTG Plus line of engines (includes Ex Plus and Sub).  
--- Affected by `lstg.SetImageScale()`.
---@param ttfname string
---@param text string
---@param left number
---@param right number
---@param bottom number
---@param top number
---@param align lstg.TextAlignment
---@param color lstg.Color
---@param scale number
function lstg.RenderTTF(ttfname, text, left, right, bottom, top, align, color, scale)
end

--------------------------------------------------------------------------------

--- Model Rendering

--- Render the model with position, scale, and Euler angle (degress) rotation  
---
--- Readded in LuaSTG Sub v0.15.0.
---@param modname string
---@param x number 
---@param y number
---@param z number
---@param roll number|nil
---@param pitch number|nil
---@param yaw number|nil
---@param xscale number|nil
---@param yscale number|nil
---@param zscale number|nil
function lstg.RenderModel(modname, x, y, z, roll, pitch, yaw, xscale, yscale, zscale)
end

--- Render collision detection, turn on/off with F8.  
--- Will render groups 1, 2, 4, and 5 (total of four collision groups).  
---
--- Readded in LuaSTG Sub v0.16.1.
function lstg.DrawCollider()
end

--- Renders the colliders of the specified collision group with the specified color.  
---
--- Readded in LuaSTG Sub v0.16.1.
---@param group number
---@param color lstg.Color
function lstg.RenderGroupCollider(group, color)
end

--------------------------------------------------------------------------------

--- Post-processing/shaders (advanced feature, highly platform-dependent)

---@alias lstg.PostEffectSamplerState
---| 0 # point+wrap
---| 1 # point+clamp
---| 2 # point+border_black
---| 3 # point+border_white
---| 4 # linear+wrap
---| 5 # linear+clamp
---| 6 # linear+border_black
---| 7 # linear+border_white

--- Apply the effects to the texture and render it to the screen.  
---
--- Changed in LuaSTG Sub.
---@param fxname string
---@param texname string
---@param samplerstate lstg.PostEffectSamplerState
---@param blendmode lstg.BlendMode
---@param floatbuffer { [1]: number, [2]: number, [3]: number, [4]: number }[]
---@param texparam { [1]: string, [2]: lstg.PostEffectSamplerState }[]
function lstg.PostEffect(fxname, texname, samplerstate, blendmode, floatbuffer, texparam)
end

-- Reference shader（boss_distortion.hlsl）
--[[

// Engine parameters

SamplerState screen_texture_sampler : register(s4); // Render target sampler
Texture2D screen_texture            : register(t4); // Render target texture
cbuffer engine_data : register(b1)
{
    float4 screen_texture_size;
    float4 viewport;
};

// User parameters

cbuffer user_data : register(b0)
{
    float4 center_pos;   // Effect center.
    float4 effect_color; // Effect center's color, using colorburn algorithm.
    float4 effect_param; // Effect parameters (in order): effect size, distortion factor, color diffusion size, and external timer.
};

#define effect_size       effect_param.x
#define effect_arg        effect_param.y
#define effect_color_size effect_param.z
#define timer             effect_param.w

// Shader constants

float PI = 3.14159265f;
float inner = 1.0f; // Edge indentation
float cb_64 = 64.0f / 255.0f;

// Shader methods

float2 Distortion(float2 xy, float2 delta, float delta_len)
{
    float k = delta_len / effect_size;
    float p = pow((k - 1.0f), 0.75f);
    float arg = effect_arg * p;
    float2 delta1 = float2(
             // 1.75f: The higher this term is, the more "broken" the ripples look.
            sin(1.75f * 2.0f * PI * delta.x + 0.05f * delta_len + timer / 20.0f),
            sin(1.75f * 2.0f * PI * delta.y + 0.05f * delta_len + timer / 24.0f)
    );
                          // 0.005f: Increasing this term increases ripple density.
    float delta2 = arg * sin(0.005f * 2.0f * PI * delta_len+ timer / 40.0f);
    // delta1 is the direction vector, delta2 is the vector length; i.e. return the direction and distance of pixel movement.
    return delta1 * delta2;
}

// Main methods

struct PS_Input
{
    float4 sxy : SV_Position;
    float2 uv  : TEXCOORD0;
    float4 col : COLOR0;
};
struct PS_Output
{
    float4 col : SV_Target;
};

PS_Output main(PS_Input input)
{
    float2 xy = input.uv * screen_texture_size.xy;  // Actual screen position
    if (xy.x < viewport.x || xy.x > viewport.z || xy.y < viewport.y || xy.y > viewport.w)
    {
        discard; // Discard pixels outside the range to avoid accidental spilling.
    }
    float2 uv2 = input.uv;
    float2 delta = xy - center_pos.xy;  // Calculates the vector from the effect center to the texture sampling point.
    float delta_len = length(delta);
    delta = normalize(delta);
    if (delta_len <= effect_size)
    {
        float2 distDelta = Distortion(xy, delta, delta_len);
        float2 resultxy = xy + distDelta;
        if (resultxy.x > (viewport.x + inner) && resultxy.x < (viewport.z - inner) && resultxy.y > (viewport.y + inner) && resultxy.y < (viewport.w - inner))
        {
            uv2 += distDelta / screen_texture_size.xy;
        }
        else
        {
            uv2 = input.uv;
        }
    }
    
    float4 tex_color = screen_texture.Sample(screen_texture_sampler, uv2); // Sample the texture
    if (delta_len <= effect_color_size)
    {
        // Distort the coloring
        float k = delta_len / effect_color_size;
        float ak = effect_color.a * pow((1.0f - k), 1.2f);
        float4 processed_color = float4(max(cb_64, effect_color.r), max(cb_64, effect_color.g), max(cb_64, effect_color.b), effect_color.a);
        float4 result_color = tex_color - ((1.0f - tex_color) * (1.0f - processed_color)) / processed_color;
        tex_color.r = ak * result_color.r + (1.0f - ak) * tex_color.r;
        tex_color.g = ak * result_color.g + (1.0f - ak) * tex_color.g;
        tex_color.b = ak * result_color.b + (1.0f - ak) * tex_color.b;
    }
    tex_color.a = 1.0f;
    
    PS_Output output;
    output.col = tex_color;
    return output;
}

]]

-- Reference shader（texture_overlay.hlsl):
--[[

// Engine parameters

SamplerState screen_texture_sampler : register(s4); // Render target sampler
Texture2D screen_texture            : register(t4); // Render target texture
cbuffer engine_data : register(b1)
{
    float4 screen_texture_size;
    float4 viewport;
};

// User parameters

SamplerState screen_texture_sampler1 : register(s0);
Texture2D screen_texture1            : register(t0);

// Shader methods

float overlay(float base, float blend)
{
    // Overlay blendmode processing
    if (base < 0.5f)
    {
        return 2.0f * base * blend;
    }
    else
    {
        return 1.0f - 2.0f * (1.0f - base) * (1.0f - blend);
    }
}

// Main methods

struct PS_Input
{
    float4 sxy : SV_Position;
    float2 uv  : TEXCOORD0;
    float4 col : COLOR0;
};
struct PS_Output
{
    float4 col : SV_Target;
};

PS_Output main(PS_Input input)
{
    float4 color_top = screen_texture.Sample(screen_texture_sampler, input.uv);
    float4 color_bot = screen_texture1.Sample(screen_texture_sampler1, input.uv);
    float4 color_out;

    color_out.r = overlay(color_bot.r, color_top.r);
    color_out.g = overlay(color_bot.g, color_top.g);
    color_out.b = overlay(color_bot.b, color_top.b);

    color_out = lerp(color_bot, color_out, color_top.a);

    color_out.a = 1.0f - (1.0f - color_bot.a) * (1.0f - color_top.a);
    
    PS_Output output;
    output.col = color_out;
    return output;
}

]]

-- Usage:
--[[

lstg.PushRenderTarget("A")
-- Render something
lstg.PopRenderTarget()

lstg.PushRenderTarget("B")
-- Render something
lstg.PopRenderTarget()

lstg.PostEffect("texture_overlay", "A", 6, "", {
    -- No float parameters
}, {
    { "B", 6 }, -- Binds to `t0`, `s0`
})

lstg.PushRenderTarget("C")
-- Render something
lstg.PopRenderTarget()

lstg.PostEffect(
    "boss_distortion", -- effect name
    "C", 6,
    "",
    {
        -- Total of 3 `float4`s
        { x1, y1, 0, 0 }, -- centerX, centerY, the rest is for alignment and are unused
        { fxr / 255.0, fxg / 255.0, fxb / 255.0, 125.0 / 255.0 }, -- color in floating point, 0 to 1 instead of 0 to 255
        {
            _boss.aura_alpha * 400 * lstg.scale_3d, -- size
            1500 * _boss.aura_alpha / 128 * lstg.scale_3d, -- arg
            _boss.aura_alpha * 400 * lstg.scale_3d, -- colorsize
            _boss.timer, -- timer
        },
    },
    {} -- No textures/samplerstates
)

]]
