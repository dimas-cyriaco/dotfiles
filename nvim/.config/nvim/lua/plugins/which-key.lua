return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").register({
      ["<leader><tab>"] = { name = "+tabs" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>h"] = { name = "+harpoon" },
      ["<leader>n"] = { name = "+neorg" },
      ["<leader>o"] = { name = "+overseer" },
      ["<leader>q"] = { name = "+quit/session" },
      ["<leader>r"] = { name = "+rest" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>t"] = { name = "+test" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>w"] = { name = "+windows" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },
    })
  end,
}
