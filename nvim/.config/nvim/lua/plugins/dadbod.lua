-- local sql_ft = { "sql", "mysql", "plsql" }

return {
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   optional = true,
  --   opts = function(_, opts)
  --     if type(opts.ensure_installed) == "table" then
  --       vim.list_extend(opts.ensure_installed, { "sql" })
  --     end
  --   end,
  -- },
  -- {
  --   "folke/edgy.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     table.insert(opts.right, {
  --       title = "Database",
  --       ft = "dbui",
  --       pinned = true,
  --       open = function()
  --         vim.cmd("DBUI")
  --       end,
  --     })
  --
  --     table.insert(opts.bottom, {
  --       title = "DB Query Result",
  --       ft = "dbout",
  --     })
  --   end,
  -- },
  {
    "tpope/vim-dadbod",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      vim.g.db_ui_save_location = "~/code/db"
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_execute_on_save = true
      vim.g.db_ui_use_nvim_notify = true

      -- vim.api.nvim_create_autocmd("FileType", {
      --   -- pattern = sql_ft,
      --   callback = function()
      --     ---@diagnostic disable-next-line: missing-fields
      --     local cmp = require("cmp")
      --     local global_sources = cmp.get_config().sources
      --     local buffer_sources = {}
      --
      --     -- add globally defined sources (see separate nvim-cmp config)
      --     -- this makes e.g. luasnip snippets available since luasnip is configured globally
      --     if global_sources then
      --       for _, source in ipairs(global_sources) do
      --         table.insert(buffer_sources, { name = source.name })
      --       end
      --     end
      --
      --     -- add vim-dadbod-completion source
      --     table.insert(buffer_sources, { name = "vim-dadbod-completion" })
      --
      --     -- update sources for the current buffer
      --     cmp.setup.buffer({ sources = buffer_sources })
      --   end,
      -- })
    end,
  },
}
