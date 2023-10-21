return {
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>rr", "<Plug>RestNvim", desc = "Run request" },
  },
  commit = "8b62563",
  config = function()
    require('rest-nvim').setup()
  end
}
