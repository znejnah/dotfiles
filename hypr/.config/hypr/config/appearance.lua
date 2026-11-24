-----------------------
---- LOOK AND FEEL ----
-----------------------

local theme = require("config.theme")

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 6,
        gaps_out = 12,

        border_size = 2,

        col = {
            -- Active window: Gradient from primary to secondary theme accent
            active_border   = { colors = { theme.accent_primary, theme.accent_secondary }, angle = 45 },
            -- Inactive window: Subtle passive border
            inactive_border = theme.border_inactive,
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 0.92,

        shadow = {
            enabled      = true,
            range        = 6,
            render_power = 3,
            -- Subtle accent glow for window shadows
            color        = theme.shadow_glow,
        },

        blur = {
                    enabled           = true,
                    size              = 5,
                    passes            = 2,
                    new_optimizations = true,
                    vibrancy          = 0.25,
                    brightness        = 1.05,
                    contrast          = 1.05,
                    ignore_opacity    = false,
                },
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})
