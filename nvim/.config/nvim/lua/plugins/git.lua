return {
  {
    "ruifm/gitlinker.nvim",
    event = { "LazyFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup()
    end,
  },
}
