-- Persistent workspaces 1-5.
--
-- Waybar's `ext/workspaces` module (the one that works with Hyprland's Lua
-- config) only lists workspaces that actually exist. Hyprland normally
-- destroys an empty workspace, so the bar would only show the ones in use.
-- Marking 1-5 persistent keeps all five buttons in the bar at all times.

for i = 1, 5 do
    hl.workspace_rule({
        workspace  = tostring(i),
        persistent = true,
    })
end
