return {
  "folke/zen-mode.nvim",
  keys = {
    {
      "<leader>uz",
      "<cmd> ZenMode <cr>",
      desc = "Toggle Zen Mode",
    },
  },
}
-- return {
--   "Pocco81/true-zen.nvim",
--   cmd = { "TZAtaraxis", "TZFocus", "TZNarrow", "TZMinimalist" },
--   config = function()
--     require("true-zen").setup({
--       integrations = {
--         twilight = true, -- enable twilight (ataraxis)
--         lualine = true, -- hide nvim-lualine (ataraxis)
--       },
--       modes = {
--         narrow = {
--           --- change the style of the fold lines. Set it to:
--           --- `informative`: to get nice pre-baked folds
--           --- `invisible`: hide them
--           --- function() end: pass a custom func with your fold lines. See :h foldtext
--           folds_style = "invisible",
--         },
--       },
--     })
--   end,
-- }
