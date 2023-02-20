return {
  {
    "marko-cerovac/material.nvim",
    lazy = true,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
    },
    init = function()
      vim.g.material_style = "darker"
    end,
  },
}
