return {
  "jellydn/hurl.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = "hurl",
  opts = {
    -- Show debugging info
    debug = false,
    -- Show notification on run
    show_notification = false,
    -- Show response in popup or split
    mode = "split",
    -- Default formatter
    formatters = {
      json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
      html = {
        "prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
        "--parser",
        "html",
      },
    },
  },
  keys = {
    -- Run API request
    { "<leader>ra", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
    { "<leader>rr", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
    { "<leader>re", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
    { "<leader>rm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
    { "<leader>rv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
    -- Run Hurl request in visual mode
    { "<leader>r", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
  },
}
-- return {
--   {
--     "vhyrro/luarocks.nvim",
--     ft = "http",
--     priority = 1000,
--     config = true,
--     opts = {
--       rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
--     }
--   },
--   {
--     "rest-nvim/rest.nvim",
--     ft = "http",
--     dependencies = { "luarocks.nvim" },
--     config = function()
--       require("rest-nvim").setup()
--       -- first load extension
--       require("telescope").load_extension("rest")
--     end,
--     keys = {
--       {
--         "<leader>rr",
--         mode = { "n" },
--         "<cmd>Rest run<cr>",
--         desc = "Run request under the cursor",
--       },
--       {
--         "<leader>re",
--         mode = { "n" },
--         function()
--           -- then use it, you can also use the `:Telescope rest select_env` command
--           require("telescope").extensions.rest.select_env()
--         end,
--         desc = "Select environment",
--       },
--       -- {
--       --   "<localleader>rl", "<cmd>Rest run last<cr>", "Re-run latest request",
--       -- },
--     }
--   }
-- }
