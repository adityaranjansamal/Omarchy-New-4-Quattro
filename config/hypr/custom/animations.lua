-- ~/.config/hypr/custom/animations.lua

-- macOS-style easing
hl.curve("mac", {
  type = "bezier",
  points = {
    { 0.22, 1.0 },
    { 0.36, 1.0 },
  },
})

-- Workspace transitions
hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 8,
  bezier = "default",
  style = "slide",
})

-- Window transitions
hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 6,
  bezier = "mac",
  style = "popin 85%",
})

-- Border transitions
hl.animation({
  leaf = "border",
  enabled = true,
  speed = 8,
  bezier = "default",
})

-- Fade transitions
hl.animation({
  leaf = "fade",
  enabled = true,
  speed = 6,
  bezier = "default",
})
