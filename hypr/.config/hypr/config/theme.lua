-- hypr/.config/hypr/config/theme.lua
-- Theme: Vice City / Leonida (Abyssal Night & Soft Vapor)

return {
    -- Hyprland rgba() format
    accent_primary   = "rgba(ff5ca8ee)", -- Sunset Pink
    accent_secondary = "rgba(00f0ffee)", -- Vice Cyan
    accent_gradient  = "rgba(ff5ca8ee) rgba(8c6cffee) rgba(00f0ffee) 45deg",
    shadow_glow      = "rgba(ff5ca833)", -- Sunset Pink ambient glow
    border_inactive  = "rgba(8c6cff44)", -- Neon Purple passive frame

    -- Hex formats (#RRGGBB & #RRGGBBAA for CLI tools)
    hex = {
        bg        = "#07091b", -- Abyssal Night
        surface   = "#0f1436", -- Deep Bay
        primary   = "#ff5ca8", -- Sunset Pink
        secondary = "#00f0ff", -- Vice Cyan
        purple    = "#8c6cff", -- Neon Purple
        peach     = "#ffb86b", -- Miami Peach
        text      = "#d5ddf7", -- Soft Vapor
    },
    slurp = {
        background = "#07091b88", -- Abyssal Night dimmed mask
        border     = "#ff5ca8ff", -- Sunset Pink crisp border
        selection  = "#00f0ff1f", -- Vice Cyan HUD selection tint
    },
}
