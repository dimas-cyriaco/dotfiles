return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- {
    --   "<leader><leader>",
    --   "<cmd>Telescope find_files hidden=true no_ignore=false<cr>",
    --   desc = "Find files",
    -- },
    {
      "<leader>/",
      function()
        require("telescope.builtin").live_grep({
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
        })
      end,
      desc = "Live Grep",
    },
  },
  config = function()
    require("telescope").setup({})
  end,
}
