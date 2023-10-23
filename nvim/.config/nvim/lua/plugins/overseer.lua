return {
  "stevearc/overseer.nvim",
  keys = {
    {
      "<leader>oo",
      function()
        require("overseer").open()
      end,
      desc = "Open Panel",
    },
    {
      "<leader>or",
      function()
        require("overseer").run_template()
      end,
      desc = "Run Tas",
    },
  },
  opts = {},
}
