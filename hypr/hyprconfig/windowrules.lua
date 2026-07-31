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

hl.window_rule({
    name  = "float-settings-dialogs",
    match = { class = "^(nm-connection-editor|blueman-manager|com\\.saivert\\.pwvucontrol)$" },

    float  = true,
    size   = "600 400",
    center = true
})