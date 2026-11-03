hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse   = 1,

        -- Restore the default pointer feel: adaptive acceleration, no
        -- forced raw movement. This is what you had before the Hyprland
        -- config was applied. Raise `sensitivity` (e.g. 0.2) if you want
        -- it even faster.
        sensitivity    = 0,
        accel_profile  = "adaptive",
        force_no_accel = false,

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Optional per-device tuning.
-- See https://wiki.hypr.land/configuring/core/devices/
-- Use real names from `hyprctl devices`, for example:
--
-- hl.device({
--     name        = "synps/2-synaptics-touchpad",
--     sensitivity = 0.0,
-- })
