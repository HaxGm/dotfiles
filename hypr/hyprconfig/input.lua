---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "pl",

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.device({
    name          = "razer-razer-deathadder-v3",
    sensitivity   = -0.5,    -- negative = slower, positive = faster
    accel_profile = "flat",  -- optional: no acceleration, the same speed however fast you move
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
