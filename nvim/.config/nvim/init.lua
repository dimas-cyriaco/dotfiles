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

-- vim.g.nvim_tree_git_hl = 0
-- vim.api.nvim_set_var('nvim_tree_git_hl', 0)
-- vim.g["nvim_tree_git_hl"] = 0
vim.cmd("let g:nvim_tree_show_icons = { 'git': 0, 'folders': 1, 'files': 1, 'folder_arrows': 1 }")
vim.cmd("let g:nvim_tree_indent_markers = 1")

-- Mapings

vim.api.nvim_set_keymap("i", "jk", [[<Esc>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>e", [[:NvimTreeToggle<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>b", [[<cmd>Telescope buffers<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>j", [[:noh<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>la", [[<cmd>Telescope lsp_code_actions<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ld", [[<cmd>Telescope lsp_definitions<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ld", [[<cmd>Telescope lsp_document_diagnostics<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>lf", [[:lua vim.lsp.buf.formatting()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lr", [[<cmd>Telescope lsp_references<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", [[:q<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>r", [[:luafile %<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>st", [[<cmd>Telescope live_grep<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>w", [[:w<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t", [[:Trouble<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t", [[:Trouble<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ss", [[:SessionSave<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sl", [[:SessionLoad<cr>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>f",
  [[<cmd>Telescope find_files find_command=rg,--hidden,--files prompt_prefix=🔍<cr>]],
  { noremap = true }
)

require("plugins")
