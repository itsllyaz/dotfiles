-- Hyprland configuration (Lua format, Hyprland 0.57+)
-- Migrated from hyprland.conf and configs/*.conf on 2026-11-01.
-- Old files are kept in legacy-conf-backup/ for reference.

-- Split configuration modules
require("configs.looknfeel")
require("configs.animations")
require("configs.tags")
require("configs.windowrules")
require("configs.input")
require("configs.keybinds")
require("configs.workspaces")


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/configuring/core/monitors/
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = 1,
})


-------------------
---- AUTOSTART ----
-------------------

-- Autostart is handled by systemd user services so everything starts exactly
-- once and restarts if it crashes. See ~/.config/systemd/user/:
--   waybar, swaync, hypridle, hyprpolkitagent, nm-applet, blueman-applet,
--   swww (wallpaper), cliphist-watch (clipboard history), hyprsunset (night light)
-- Nothing is launched from Hyprland itself.


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/configuring/core/environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


--------------------
---- LAYOUTS ETC ----
--------------------

hl.config({
    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },

    render = {
        new_render_scheduling = true,
    },
})
