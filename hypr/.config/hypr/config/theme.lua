-- hypr/.config/hypr/config/theme.lua
-- Active Theme: Vice

return {
    -- Hyprland rgba() format
    accent_primary   = "rgba(ff2a85ee)", -- Flamingo Neon
    accent_secondary = "rgba(00f0ffee)", -- Ocean Drive Cyan
    shadow_glow      = "rgba(00f0ff33)", -- Ocean Drive Cyan (subtle glow)
    border_inactive  = "rgba(3b2d54aa)", -- Dusk Violet

    -- Hex formats (#RRGGBB & #RRGGBBAA for CLI tools like slurp)
    hex = {
        bg        = "#130f1d",
        primary   = "#ff2a85",
        secondary = "#00f0ff",
    },
    slurp = {
        background = "#130f1d66", -- Darkened semi-transparent out selection
        border     = "#ff2a85ff", -- Bordure Flamingo Neon opaque
        selection  = "#00f0ff1a", -- Ocean Drive Cyan light veil on selected zone
    },
}
