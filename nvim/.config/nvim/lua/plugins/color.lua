return {
  {
    "folke/tokyonight.nvim",
    event = { "VeryLazy" },
    opts = {
      style = "storm",
      on_highlights = function(hl, c)
        hl.Folded = {
          bg = c.bg_highlight,
          fg = c.cyan,
        }
        hl.UfoCursorFoldedLine = {
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
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
}
