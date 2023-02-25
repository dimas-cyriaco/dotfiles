return {
  { "AlexvZyl/nordic.nvim" },
  {
    "marko-cerovac/material.nvim",
    lazy = true,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordic",
    },
    init = function()
      vim.g.material_style = "darker"
    end,
  },
}
