return {
  "dmmulroy/tsc.nvim",
  keys = {
    {
      "<leader>cc",
      "<cmd>TSC<cr>",
      desc = "Type-check Project",
    },
  },
  config = function()
    require("tsc").setup()
  end,
}
