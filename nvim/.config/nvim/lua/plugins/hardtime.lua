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
    require("hardtime").setup({
      max_count = 10,
      disable_mouse = false,
      disabled_filetypes = {
        "dbout",
        "dbui",
        "help",
        "httpResult",
        "https",
        "lazy",
        "mason",
        "neo-tree",
        "neo-tree-popup",
        "NeogitCommitView",
        "NeogitStatus",
        "neotest-summary",
        "netrw",
        "noice",
        "NvimTree",
        "octo",
        "qf",
      },
    })
  end,
}
