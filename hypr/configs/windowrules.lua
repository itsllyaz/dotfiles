-- ============================================================
-- APPLICATIONS - BLUR & OPACITY
-- ============================================================

hl.window_rule({
    name    = "mpv-vlc",
    match   = { class = "^([Mm]pv|vlc)$" },
    no_blur = true,
    opacity = "1.0 override",
    float   = true,
    size    = "900 506",
})

hl.window_rule({
    name    = "nautilus-opacity",
    match   = { class = "^(org.gnome.Nautilus)$" },
    opacity = "0.8 override",
})

hl.window_rule({
    name    = "text-editors-opacity",
    match   = { class = "^(gedit|org.gnome.TextEditor|mousepad)$" },
    opacity = "0.9 override",
})

hl.window_rule({
    name    = "pavucontrol",
    match   = { class = "^(org.pulseaudio.pavucontrol)$" },
    opacity = "0.9 override",
    float   = true,
    size    = "50% 60%",
})

hl.window_rule({
    name    = "kitty-opacity",
    match   = { class = "^(kitty)$" },
    opacity = "0.9 override",
})

hl.window_rule({
    name    = "chat-apps-opacity",
    match   = { class = "^(discord|vesktop|org.telegram.desktop)$" },
    opacity = "0.85 override",
})

hl.window_rule({
    name    = "spotify-opacity",
    match   = { class = "^(Spotify)$" },
    opacity = "0.8 override",
})

hl.window_rule({
    name    = "zen-opacity",
    match   = { class = "^(zen)$" },
    opacity = "0.9 override",
})


-- ============================================================
-- LAYER RULES
-- ============================================================

hl.layer_rule({
    name         = "waybar-layer",
    match        = { namespace = "^(waybar)$" },
    blur         = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name         = "notif-layer",
    match        = { namespace = "^(notif)$" },
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name  = "logout-dialog-layer",
    match = { namespace = "^(logout_dialog)$" },
    blur  = true,
})


-- ============================================================
-- SWAYNC BLUR & XRAY
-- ============================================================

hl.layer_rule({
    name         = "swaync-control-center",
    match        = { namespace = "^(swaync-control-center)$" },
    blur         = true,
    ignore_alpha = 0.5,
    xray         = false,
})

hl.layer_rule({
    name         = "swaync-notification-window",
    match        = { namespace = "^(swaync-notification-window)$" },
    blur         = true,
    ignore_alpha = 0.5,
    xray         = false,
})


-- ============================================================
-- FLOATING WINDOWS
-- ============================================================

hl.window_rule({
    name  = "float-settings-apps",
    match = { class = "^(nm-applet|nm-connection-editor|blueman-manager|org.gnome.FileRoller)$" },
    float = true,
})

hl.window_rule({
    name  = "float-viewers",
    match = { class = "^(org.gnome.SystemMonitor|org.gnome.Evince|eog|org.gnome.Loupe)$" },
    float = true,
})


-- ============================================================
-- IGNORE MAXIMIZE REQUESTS FROM APPS
-- ============================================================

hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})


-- ============================================================
-- FIX SOME DRAGGING ISSUES WITH XWAYLAND
-- ============================================================

hl.window_rule({
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


-- ============================================================
-- POPUPS AND DIALOGUES
-- ============================================================

hl.window_rule({
    name  = "save-dialogs",
    match = { title = "^(Save As|Save a File|Pick Files)$" },
    float = true,
    size  = "50% 60%",
    center = true,
})

hl.window_rule({
    name  = "open-files-dialog",
    match = { title = "^(Open Files)$" },
    float = true,
    size  = "70% 60%",
})

-- ============================================================
-- APP-MODE WEB WINDOWS (Notion, Notion Calendar)
-- ============================================================

-- Chrome app-mode windows derive their WM class from the URL, e.g.
--   chrome-calendar.notion.so__-Default
hl.window_rule({
    name   = "webapp-notion",
    match  = { class = "^chrome-.*notion\\.so.*$" },
    float  = true,
    size   = "1280 820",
    center = true,
})
