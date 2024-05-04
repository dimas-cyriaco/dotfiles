-- return {}
return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>gpl",
      "<cmd>Octo pr list<cr>",
      desc = "List PRs",
    },
    {
      "<leader>grs",
      "<cmd>Octo review start<cr>",
      desc = "Start review",
    },
    {
      "<leader>gru",
      "<cmd>Octo review submit<cr>",
      desc = "Submit review",
    },
  },
  config = function()
    require("octo").setup()
  end,
}
