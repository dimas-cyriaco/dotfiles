-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

-- vim.keymap.set("n", "j", "<nop>", { silent = true })
-- vim.keymap.set("n", "k", "<nop>", { silent = true })
-- vim.keymap.set("n", "h", "<nop>", { silent = true })
-- vim.keymap.set("n", "l", "<nop>", { silent = true })
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
  ":lua require('telescope.builtin').live_grep({ additional_args = { '--hidden' } })<cr>",
  { silent = true, desc = "Find in Files" }
)

vim.keymap.set("n", "<leader>fy", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
end, { silent = true, desc = "Copy file relative path" })

vim.keymap.set("n", "<c-;>", "<cmd>e #<cr>", { desc = "Go to previous file" })

vim.keymap.set("n", "<C-/>", function()
  Util.terminal(nil, { border = "rounded" })
end, { silent = true, desc = "Term with border" })

vim.keymap.set("n", "<C-_>", function()
  Util.terminal(nil, { border = "rounded" })
end, { silent = true, desc = "Term with border" })

vim.keymap.set("n", "<leader>uk", function()
  if vim.opt.scrolloff:get() == 999 then
    vim.opt.scrolloff = 0
  else
    vim.opt.scrolloff = 999
  end
end, { silent = true, desc = "Toggle scrolloff" })
