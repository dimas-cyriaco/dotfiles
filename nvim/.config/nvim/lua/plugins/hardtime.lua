return {
  "m4xshen/hardtime.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    {
      "<leader>uh",
      "<cmd>Hardtime toggle<cr>",
      desc = "Toggle Hardtime",
    },
  },
  config = function()
    require("hardtime").setup()
  end,
}
