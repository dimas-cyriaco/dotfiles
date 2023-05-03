return {
  {
    "LazyVim/LazyVim",
    dependencies = {
      "marko-cerovac/material.nvim",
      "AlexvZyl/nordic.nvim",
      "ellisonleao/gruvbox.nvim",
      "RRethy/nvim-base16",
      "rebelot/kanagawa.nvim",
      "Shatur/neovim-ayu",
    },
    opts = {
      colorscheme = "ayu-mirage",
    },
    init = function()
      -- vim.g.material_style = "darker"
      vim.g.background = "dark"
      require("kanagawa").load("wave")
    end,
  },
}
