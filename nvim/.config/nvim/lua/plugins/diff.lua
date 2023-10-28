return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-web-devicons" },
  keys = {
    { "<leader>gd", ":DiffviewOpen<cr>", desc = "View diff" },
    { "<leader>ge", ":DiffviewFileHistory %<cr>", desc = "View file history" },
  },
}
