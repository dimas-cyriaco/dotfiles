local utils = require('utils')
local map = utils.map

-- General mappings
map('n', ';', ':')
map('i', 'tn', '<Esc>')
map('n', '<leader>w', ':silent w<cr>')
map('n', '<leader>q', ':q<cr>')

-- Editing init files
map('n', '<leader>ne', ':vsplit $MYVIMRC<cr>')
map('n', '<leader>ns', ':source $MYVIMRC<cr>')

