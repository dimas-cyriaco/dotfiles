local wezterm = require 'wezterm'




return {
  color_scheme = 'Apprentice (base16)',
  font = wezterm.font_with_fallback({
    'JetBrains Mono',
    { family = 'Symbols Nerd Font Mono', scale = 0.75 }
  }),
  font_size = 16.0,
  -- hide_tab_bar_if_only_one_tab = true,
  -- use_fancy_tab_bar = false,
  -- tab_bar_at_bottom = true,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  -- window_background_opacity = 0.9,
  leader = { key = ';', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    {
      key = '|',
      mods = 'LEADER|SHIFT',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    {
      key = 'a',
      mods = 'LEADER|CTRL',
      action = wezterm.action.SendString '\x01',
    },
  },
}
