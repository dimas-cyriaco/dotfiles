return {
  "gaelph/logsitter.nvim",
  dependents = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    {
      "<leader>ck",
      function()
        require("logsitter").log()
      end,
      desc = "Add log",
    },
  },
}
