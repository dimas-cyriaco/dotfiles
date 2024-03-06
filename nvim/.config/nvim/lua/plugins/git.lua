return {
  {
    "ruifm/gitlinker.nvim",
    event = { "LazyFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>gy",
        function()
          local gitlinker = require("gitlinker")
          gitlinker.get_buf_range_url("n", { action_callback = gitlinker.open_in_browser })
        end,
        silent = true,
      },
      {
        "<leader>gy",
        function()
          local gitlinker = require("gitlinker")
          gitlinker.get_buf_range_url("v", { action_callback = gitlinker.open_in_browser })
        end,
        mode = "v",
        silent = true,
      },
    },
    config = function()
      require("gitlinker").setup()
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    keys = {
      {
        "<leader>gm",
        function()
          local neogit = require("neogit")
          neogit.open({ kind = "vsplit" })
        end,
        desc = "Open Neogit",
        silent = true,
      },
    },
    config = function()
      local neogit = require("neogit")

      neogit.setup({})
    end,
  },
}
