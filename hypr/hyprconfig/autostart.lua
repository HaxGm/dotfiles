-------------------
---- AUTOSTART ----
-------------------


hl.on("hyprland.start", function ()
  -- Pass Wayland environment variables to systemd user services, then start polkit agent
  -- Using && to ensure env vars are propagated before hyprpolkitagent starts
  hl.exec_cmd("sh -c 'dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP && systemctl --user start hyprpolkitagent'")
  hl.exec_cmd("waybar")
  hl.exec_cmd("swaync")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("hypridle")
 end)