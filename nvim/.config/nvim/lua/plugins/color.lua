return {
  {
    "folke/tokyonight.nvim",
    event = { "VeryLazy" },
    opts = { style = "storm" },
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
