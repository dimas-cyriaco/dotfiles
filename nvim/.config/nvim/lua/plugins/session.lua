return {
  "jedrzejboczar/possession.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("possession").setup({
      autosave = {
        current = true,
        on_load = true,
        on_quit = true,
      },
      -- plugins = {
      --   delete_buffers = true,
      -- },
    })
    require("telescope").load_extension("possession")
  end,
  keys = {
    {
      "<leader>qo",
      ":Telescope possession list<cr>",
      desc = "Load Session",
    },
    {
      "<leader>qx",
      ":PossessionClose<cr>",
      desc = "Close Session",
    },
  },
}
-- return {
--   "Shatur/neovim-session-manager",
--   dependencies = { "nvim-lua/plenary.nvim" },
--   config = function()
--     local config = require("session_manager.config")
--
--     require("session_manager").setup({
--       autoload_mode = config.AutoloadMode.Disabled,
--
--       extras_generator = function(dir)
--         local handle = io.popen("git branch --show-current 2>/dev/null")
--         if handle == nil then
--           return nil
--         end
--         local branch = handle:read("l")
--         handle:close()
--         if branch == nil then
--           return nil
--         end
--         branch = branch:gsub("/", "++")
--         return branch
--       end,
--     })
--   end,
--   keys = {
--     {
--       "<leader>ql",
--       ":SessionManager load_session<cr>",
--       desc = "Open Panel",
--     },
--   },
-- }
