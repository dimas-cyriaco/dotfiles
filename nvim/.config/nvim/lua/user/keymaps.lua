vim.g.mapleader = ";"
vim.g.localmapleader = ";"

local keymap = vim.keymap.set

local options = { noremap = true, silent = true }
local terminal_options = { noremap = true, silent = true }

-- Exit insert mode
keymap({ "i" }, "jk", "<esc>", options)

-- Basic editing function
keymap({ "n" }, "<leader>w", ":w<cr>", options)
keymap({ "n" }, "<leader>q", ":q<cr>", options)
keymap({ "n" }, "<leader>h", ":nohlsearch<cr>", options)

-- File explorer
keymap({ "n" }, "<leader>e", ":NvimTreeToggle<cr>", options)

-- Better buffer navigation
keymap({ "n" }, "<s-l>", ":bnext<cr>", options)
keymap({ "n" }, "<s-h>", ":bprevious<cr>", options)

-- Better window naviagation
keymap({ "n" }, "<c-h>", "<c-w>h", options)
keymap({ "n" }, "<c-j>", "<c-w>j", options)
keymap({ "n" }, "<c-k>", "<c-w>k", options)
keymap({ "n" }, "<c-l>", "<c-w>l", options)

-- Terminal --
-- Better terminal navigation
keymap({ "t" }, "<C-h>", "<C-\\><C-N><C-w>h", terminal_options)
keymap({ "t" }, "<C-j>", "<C-\\><C-N><C-w>j", terminal_options)
keymap({ "t" }, "<C-k>", "<C-\\><C-N><C-w>k", terminal_options)
keymap({ "t" }, "<C-l>", "<C-\\><C-N><C-w>l", terminal_options)
