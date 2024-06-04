return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  keys = {
    {
      "<leader><leader>",
      "<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
      desc = "Find files",
    },
    {
      "<leader>sG",
      function()
        -- local dir = vim.env.HOME .. "/"
        require("telescope").extensions.live_grep_args.live_grep_args({
          -- search_dirs = { dir },
          additional_args = { "--hidden", "--no-ignore" },
        })
      end,
      desc = "Live Grep from Home",
    }
  },
  config = function()
    require("telescope").setup({})
  end,
}
