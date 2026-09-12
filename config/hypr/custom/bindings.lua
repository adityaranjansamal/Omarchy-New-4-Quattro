-- ~/.config/hypr/custom/bindings.lua

o.bind("CTRL + UP", "Mission Control",
  "omarchy-shell shell toggle io.github.andyweiboan.missioncontrol '{}'")

-- Optional: a dedicated exit, so CTRL+UP is never an accidental re-open.
o.bind("CTRL + DOWN", "Close Mission Control",
  "omarchy-shell shell hide io.github.andyweiboan.missioncontrol")

o.bind("SUPER + D", "Toggle Dock", "omarchy-shell -q rosakodu.dock toggleReveal")

-- Open Resources App Monitor with CTRL+SHIFT+ESCAPE
o.bind("CTRL + SHIFT + Escape", "Resources", "resources")

-- Close Active Window by Super + Q more like Mac OS
o.bind("SUPER + Q", "Close window mac os style", hl.dsp.window.close())

-- Close Active Window by ALT + F4 more like Windows
o.bind("ALT + F4", "Close window traditional", hl.dsp.window.close())
