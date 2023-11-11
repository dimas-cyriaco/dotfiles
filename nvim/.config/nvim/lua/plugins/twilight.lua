return {
  "folke/twilight.nvim",
  keys = {
    {
      "<leader>uj",
      "<cmd>Twilight<cr>",
      desc = "Toggle Twilight",
    },
  },
  opts = {
    expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
      "function_definition",
      "function",
      "method",
      "method_definition",
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
