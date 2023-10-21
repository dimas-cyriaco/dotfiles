return {
  {
    "LazyVim/LazyVim",
    dependencies = {
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
