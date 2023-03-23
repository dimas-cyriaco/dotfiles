return {
  {
    "LazyVim/LazyVim",
    dependencies = {
      "marko-cerovac/material.nvim",
      "AlexvZyl/nordic.nvim",
      "ellisonleao/gruvbox.nvim",
      "RRethy/nvim-base16",
    },
    opts = {
      colorscheme = "base16-apprentice",
    },
    init = function()
      -- vim.g.material_style = "darker"
      vim.g.background = "dark"
    end,
  },
}
