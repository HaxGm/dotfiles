--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------


local suppressMaximizeRule = hl.window_rule({   
    -- Ignore maximize requests from all apps. You'll probably like this.
    -- Made into variable for easy toggling on-off
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})


-- rofi 
hl.layer_rule({
    match = { namespace = "rofi"},
    name = "rofi-popup",
    animation = "slide bottom",
    dim_around = true
})

-- swaync 
hl.layer_rule({
    match = { namespace = "swaync-control-center"},
    name = "notification-animation",
    animation = "slide top"
})

-- nmtui-float 
hl.window_rule({
    match = { class = "^(nmtui-float)$"},
    float = true,
    size = "600 400",
    center = true
})

-- nm-connection-editor
hl.window_rule({
    match = { class = "^(nm-connection-editor)$"},
    float = true,
    size = "600 400",
    center = true
})

-- pwvucontrol
hl.window_rule({
    match = { class = "^(com\\.saivert\\.pwvucontrol)$"},
    float = true,
    size = "600 400",
    center = true
})

-- blueman-manager
hl.window_rule({
    match = { class = "^(blueman-manager)$"},
    float = true,
    size = "600 400",
    center = true
})