return {
  {
    "folke/tokyonight.nvim",
    event = { "VeryLazy" },
    opts = {
      style = "storm",
      dim_inactive = true,
      on_highlights = function(hl, c)
        hl.Folded = {
          bg = c.bg_highlight,
          fg = c.cyan,
        }
      end,
    },
  },
  "rebelot/kanagawa.nvim",
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "kdheepak/monochrome.nvim",
    event = { "VeryLazy" },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
}

-- somewhere in your config:
-- vim.cmd("colorscheme onedark")
