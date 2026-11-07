----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

-- XWayland has no fractional-scale support: at scale 1.25 it would render X11
-- clients into a 1536x960 buffer and let the compositor upscale it, which is
-- why Steam looked low-res. Render them at true native resolution instead and
-- let each app do its own scaling -- for Steam that lives in its own settings
-- (Interface -> "Scale text and icons"), not in an env var.
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})
