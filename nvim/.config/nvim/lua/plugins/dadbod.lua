return {
  {
    "tpope/vim-dadbod",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
    },
    config = function()
      vim.g.db_ui_save_location = "~/code/db"
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_execute_on_save = true
      vim.g.db_ui_use_nvim_notify = true
    end,
  },
}
