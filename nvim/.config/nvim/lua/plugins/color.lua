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
