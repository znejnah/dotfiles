-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function ()
     hl.exec_cmd("waybar & hyprpaper")
     hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

     -- Clipboard history (text + images)
     hl.exec_cmd("wl-paste --type text --watch cliphist store")
     hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
