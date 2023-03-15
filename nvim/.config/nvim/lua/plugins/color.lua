return {
  {
    "LazyVim/LazyVim",
    dependencies = {
      "marko-cerovac/material.nvim",
      "AlexvZyl/nordic.nvim",
      "ellisonleao/gruvbox.nvim",
    },
    opts = {
      colorscheme = "gruvbox",
    },
    init = function()
      -- vim.g.material_style = "darker"
      vim.g.background="dark"
    end,
  },
}
