return {
  {
    "vhyrro/luarocks.nvim",
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
-- return {
--   "rest-nvim/rest.nvim",
--   ft = "http",
--   dependencies = { "nvim-lua/plenary.nvim" },
--   keys = {
--     {
--       "<leader>rr",
--       function()
--         require("rest-nvim").run()
--       end,
--       desc = "Run request",
--       silent = true,
--     },
--   },
--   commit = "8b62563",
--   config = function()
--     require("rest-nvim").setup({
--       highlight = {
--         enabled = false,
--       },
--       result = {
--         -- toggle showing URL, HTTP info, headers at top the of result window
--         show_url = true,
--         -- show the generated curl command in case you want to launch
--         -- the same request via the terminal (can be verbose)
--         show_curl_command = false,
--         show_http_info = true,
--         show_headers = true,
--         -- executables or functions for formatting response body [optional]
--         -- set them to false if you want to disable them
--         formatters = {
--           json = "jq",
--           html = function(body)
--             return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
--           end,
--         },
--       },
--       -- Jump to request line on run
--       jump_to_request = false,
--       env_file = ".env",
--       custom_dynamic_variables = {},
--       yank_dry_run = true,
--     })
--   end,
-- }
