local utils = require('utils')
local map = utils.map

-- General mappings
map(';', ':')
map('tn', '<Esc>', {mode = 'i'})
map('<leader>w', ':silent w<cr>')
map('<leader>q', ':q<cr>')

-- Editing init files
map('<leader>ne', ':vsplit $MYVIMRC<cr>')
map('<leader>ns', ':luafile $MYVIMRC<cr>')

