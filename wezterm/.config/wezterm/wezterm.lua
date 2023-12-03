-- Pull in the wezterm API
local w = require("wezterm")
local a = w.action

-- This table will hold the configuration.
local c = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if w.config_builder then
  c = w.config_builder()
end

-- This is where you actually apply your config choices

c.font = w.font_with_fallback({
  { family = "JetBrainsMono Nerd Font", scale = 1.8 },
})
-- config.window_decorations = "RESIZE"

-- For example, changing the color scheme:
c.color_scheme = "tokyonight-storm"

c.keys = {
  {
    key = "t",
    mods = "CMD|SHIFT",
    action = a.ShowTabNavigator,
  },
  -- other keys
}

-- and finally, return the configuration to wezterm
return c
