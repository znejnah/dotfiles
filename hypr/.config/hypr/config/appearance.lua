-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 6,
        gaps_out = 12,

        border_size = 2,

        col = {
            -- Active window: Gradient from Royal Gold to Sheikah Cyan
            active_border   = { colors = {"rgba(d4af37ff)", "rgba(00e5ffff)"}, angle = 45 },
            -- Inactive window: Rock Gray (subtle and passive)
            inactive_border = "rgba(4e544baa)",
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

        -- Change transparency of focused and unfocused windows (Tablet aesthetic)
        active_opacity   = 0.90,
        inactive_opacity = 0.75,

        shadow = {
            enabled      = true,
            range        = 6,
            render_power = 3,
            -- Sheikah Energy subtle glow for window shadows
            color        = "rgba(00e5ff33)",
        },

        blur = {
            enabled        = true,
            size           = 6,
            passes         = 3,
            vibrancy       = 0.1696,
            ignore_opacity = false
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
