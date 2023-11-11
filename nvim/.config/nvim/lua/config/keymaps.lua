-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

vim.keymap.set("i", "jk", "<c-\\><c-n>", { desc = "Exit Insert Mode" })
vim.keymap.set("n", "<leader>fs", ":w <CR>", { silent = true, desc = "Save File" })
vim.keymap.set("n", "<leader>qt", "<cmd>tabclose<cr>", { silent = true, desc = "Close Tab" })
vim.keymap.set("n", "<leader>wh", "<C-w>t<C-w>H", { silent = true, desc = "Change Split to Horizontal" })
vim.keymap.set("n", "<leader>wk", "<C-w>t<C-w>K", { silent = true, desc = "Change Split to Vertical" })
vim.keymap.set(
  "n",
  "<leader>cs",
  ":Neotree document_symbols position=right<cr>",
  { silent = true, desc = "Document Symbols" }
)
vim.keymap.set(
  "n",
  "<leader>sg",
  ":lua require('telescope.builtin').live_grep({ additional_args = function() return { '--hidden' } end })<cr>",
  { silent = true, desc = "Find in Files" }
)

vim.keymap.set("n", "<C-/>", function()
  Util.terminal(nil, { border = "rounded" })
end, { silent = true, desc = "Term with border" })

vim.keymap.set("n", "<C-_>", function()
  Util.terminal(nil, { border = "rounded" })
end, { silent = true, desc = "Term with border" })
