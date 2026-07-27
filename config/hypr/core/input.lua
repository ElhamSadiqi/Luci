----------------
---- INPUT ----
----------------

hl.config({
    input = {
        kb_layout = "us,ir",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

----------------
---- GESTURE ---
----------------

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

----------------
---- DEVICES ---
----------------

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
