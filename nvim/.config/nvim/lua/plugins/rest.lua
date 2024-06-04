return {
  {
    "vhyrro/luarocks.nvim",
    ft = "http",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    }
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
      -- first load extension
      require("telescope").load_extension("rest")
    end,
    keys = {
      {
        "<leader>rr",
        mode = { "n" },
        "<cmd>Rest run<cr>",
        desc = "Run request under the cursor",
      },
      {
        "<leader>re",
        mode = { "n" },
        function()
          -- then use it, you can also use the `:Telescope rest select_env` command
          require("telescope").extensions.rest.select_env()
        end,
        desc = "Select environment",
      },
      -- {
      --   "<localleader>rl", "<cmd>Rest run last<cr>", "Re-run latest request",
      -- },
    }
  }
}
