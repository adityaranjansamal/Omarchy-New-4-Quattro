-- ~/.config/hypr/custom/input.lua

-- Global input configuration
hl.config({
  input = {
    -- Determines whether cursor movement changes the focused window
    follow_mouse = 0,

    -- Selects the libinput pointer acceleration profile
    accel_profile = "adaptive",

    -- Controls the default pointer sensitivity
    sensitivity = 1,
  },
})

-- Fix default apps selection menu in nautilus

--  hl.config({
--    cursor = {
--        no_warps = true,
--    },
--})

-- Per-device input configuration
hl.device({
  -- Exact name of the ELAN touchpad known by using hyprctl devices command
  name = "elan0b00:00-04f3:30ea-touchpad",

  -- Overrides the global pointer sensitivity for this device
  sensitivity = 0.35,
})
