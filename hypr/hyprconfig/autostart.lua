-------------------
---- AUTOSTART ----
-------------------


hl.on("hyprland.start", function () 
  -- Pass Wayland environment variables to systemd user services
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("waybar")
  hl.exec_cmd("swaync")
  hl.exec_cmd("awww-daemon")
 end)