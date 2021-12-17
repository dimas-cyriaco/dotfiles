vim.g.mapleader = ";"
vim.cmd("syntax enable")

vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 1
vim.o.completeopt = "menu,menuone,noselect"
vim.o.mouse = "a"
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.timeoutlen = 400
vim.o.undofile = true
vim.o.updatetime = 250

-- Mapings

vim.api.nvim_set_keymap("i", "jk", [[<Esc>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>j", [[:noh<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", [[:q<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>w", [[:w<cr>]], { noremap = true, silent = true })
