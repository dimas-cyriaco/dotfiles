-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<c-\\><c-n>", { desc = "Exit Insert Mode" })
vim.keymap.set("n", "<leader>fs", ":w <CR>", { desc = "Save File" })
vim.keymap.set("n", "<leader>wh", "<C-w>t<C-w>H", { desc = "Change Split to Horizontal" })
vim.keymap.set("n", "<leader>wk", "<C-w>t<C-w>K", { desc = "Change Split to Vertical" })
