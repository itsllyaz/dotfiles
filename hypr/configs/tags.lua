-- Window tags, converted from tags.conf.
hl.window_rule({
    name  = "tag-multimedia-video",
    match = { class = "^([Mm]pv|vlc)$" },
    tag   = "multimedia_video",
})

hl.window_rule({
    name  = "tag-settings-applets",
    match = { class = "^(nm-applet|nm-connection-editor|blueman-manager|org.gnome.FileRoller)$" },
    tag   = "settings",
})

hl.window_rule({
    name  = "tag-settings-utils",
    match = { class = "^(org.gnome.DiskUtility|wihotspot(-gui)?)$" },
    tag   = "settings",
})

hl.window_rule({
    name  = "tag-viewer-system-monitor",
    match = { class = "^(org.gnome.SystemMonitor)$" },
    tag   = "viewer",
})

hl.window_rule({
    name  = "tag-viewer-evince",
    match = { class = "^(org.gnome.Evince)$" },
    tag   = "viewer",
})

hl.window_rule({
    name  = "tag-viewer-images",
    match = { class = "^(eog|org.gnome.Loupe)$" },
    tag   = "viewer",
})
