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

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})