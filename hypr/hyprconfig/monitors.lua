------------------
---- MONITORS ----
------------------

-- This laptop's built-in panel. If you cloned these dotfiles, this is the
-- first thing to change — `hyprctl monitors` prints your own output names.
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1200@60",
    position = "0x0",
    scale    = "1.25",
})

-- Catch-all for anything not named above, so an unknown monitor still lights
-- up at its preferred mode instead of depending on defaults
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})