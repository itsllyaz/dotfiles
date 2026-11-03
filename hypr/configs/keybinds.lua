local programs = require("configs.programs")

local mainMod = "SUPER" -- Sets the "Windows" key as the main modifier

-- Example binds, see https://wiki.hypr.land/configuring/core/binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(programs.terminal))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(programs.terminal, { float = true, size = "800 550" }))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind("CTRL + ALT + Delete", hl.dsp.exit()) -- exit Hyprland
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.file_manager))
hl.bind(mainMod .. " + Space", hl.dsp.window.float())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(programs.menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/wbrestart.sh"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd('xdg-open "https://"')) -- default browser
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/hyprlock.sh"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/wppicker.sh"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("~/.config/hypr/scripts/KillActiveProcess.sh")) -- Kill active process
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/WaybarStyles.sh")) -- Waybar Styles Menu
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/WaybarLayout.sh")) -- Waybar Layout Menu
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar")) -- Hide Waybar
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("kitty yazi")) -- Yazi File Manager

-- Comfort extras
hl.bind(mainMod .. " + grave",     hl.dsp.exec_cmd("~/.config/hypr/scripts/dashboard-toggle.sh")) -- Dashboard / home page
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("~/.config/hypr/scripts/cliphist-picker.sh")) -- Clipboard history
hl.bind(mainMod .. " + A",         hl.dsp.exec_cmd("pavucontrol")) -- Audio mixer
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("~/.config/hypr/scripts/nightlight.sh")) -- Night light toggle

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.move({ direction = "down" }))

-- Resize windows
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 50,  y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.resize({ x = 0, y = 50,  relative = true }), { repeating = true })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --inc"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --dec"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh --inc"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh --dec"), { locked = true, repeating = true })

hl.bind("F3", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh --dec"), { locked = true, repeating = true })
hl.bind("F4", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh --inc"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Screenshots (from the bottom of the old hyprland.conf)
hl.bind("CTRL + P", hl.dsp.exec_cmd("grim ~/Pictures/screenshot.png"))
hl.bind("PRINT",    hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -')) -- Annotate a region screenshot
