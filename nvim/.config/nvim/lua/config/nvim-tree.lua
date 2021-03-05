local utils = require('utils')
local map = utils.map

vim.g.nvim_tree_ignore = {'.git', 'node_modules'}
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_quit_on_open = 1

map('n', '<leader>tt', ':NvimTreeToggle<CR>')
map('n', '<leader>tr', ':NvimTreeRefresh<CR>')
map('n', '<leader>tn', ':NvimTreeFindFile<CR>')
