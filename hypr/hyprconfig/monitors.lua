------------------
---- MONITORS ----
------------------

-- This laptop's built-in panel. If you cloned these dotfiles, this is the
-- first thing to change — `hyprctl monitors` prints your own output names.
local LAPTOP = "eDP-1"

local function enable_laptop()
    hl.monitor({
        output   = LAPTOP,
        mode     = "1920x1200@60",
        position = "0x0",
        scale    = "1.25",
    })
end

enable_laptop()

hl.monitor({
    output   = "desc:AOC 24G2W1G4 0x000147D7",
    mode     = "1920x1080@144",
    position = "auto",
    scale    = 1,
})

-- Catch-all for anything not named above, so an unknown monitor still lights
-- up at its preferred mode instead of depending on defaults
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- While any external monitor is connected, the laptop panel is turned off and
-- everything goes to the external one. Unplug it and the panel comes back.
-- get_monitors() only lists enabled outputs, so a disabled panel is absent.
local function sync_laptop_panel()
    local laptop_on, external = false, false
    for _, m in ipairs(hl.get_monitors()) do
        if m.name == LAPTOP then
            laptop_on = true
        else
            external = true
        end
    end

    if external and laptop_on then
        hl.monitor({ output = LAPTOP, disabled = true })
    elseif not external and not laptop_on then
        enable_laptop()
    end
end

-- Runs on config reload. At startup no outputs exist yet, so this does nothing
-- and the monitor.added events below handle it instead.
sync_laptop_panel()

-- Deferred, because during monitor.removed the departing output may still be
-- listed by get_monitors().
local function sync_soon()
    hl.timer(sync_laptop_panel, { timeout = 500, type = "oneshot" })
end

hl.on("monitor.added", sync_soon)
hl.on("monitor.removed", sync_soon)
