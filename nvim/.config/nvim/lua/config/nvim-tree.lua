local utils = require('utils')
local map = utils.map

vim.g.nvim_tree_ignore = {'.git', 'node_modules'}
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_quit_on_open = 1

map('<leader>tt', ':NvimTreeToggle<CR>')
map('<leader>r', ':NvimTreeRefresh<CR>')
map('<leader>tn', ':NvimTreeFindFile<CR>')
