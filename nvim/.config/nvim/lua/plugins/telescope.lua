return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader><leader>",
      "<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
      desc = "Find files",
    }
  },
  config = function()
    require("telescope").setup({})
  end,
}
