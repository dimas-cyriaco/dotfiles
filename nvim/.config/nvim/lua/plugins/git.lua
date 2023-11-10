return {
  {
    "ruifm/gitlinker.nvim",
    event = { "LazyFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup()
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
  },
}
