-- ~/.config/hypr/custom/gestures.lua

-- Trackpad: natural scrolling
hl.config({
  input = {
    touchpad = {
      natural_scroll = true,
    },
  },
})

-- Three-finger horizontal swipe → switch workspace
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

-- Four-finger horizontal swipe → switch workspace
hl.gesture({
  fingers = 4,
  direction = "horizontal",
  action = "workspace",
})
