-- ~/.config/hypr/custom/windows.lua

-- Qt/KDE apps (Qt5 + Qt6): stop them drawing their own titlebar/buttons.
-- Hyprland's own border (including the accent-colored focus outline) is
-- drawn separately by the compositor and is untouched by this.
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
