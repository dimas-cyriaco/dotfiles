local utils = require('utils')

local opt = utils.opt
local cmd = vim.cmd
local indent = 2

-- cmd 'scriptencoding utf-8'

opt('o', 'clipboard', 'unnamedplus')
opt('b', 'expandtab', true)
opt('o', 'hidden', true)
opt('o', 'mouse', 'a')
opt('o', 'backup', false)
opt('o', 'hlsearch', false)
opt('o', 'ruler', false)
opt('o', 'showcmd', false)
opt('o', 'showmode', false)
opt('o', 'writebackup', false)
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('o', 'splitright', true)
opt('o', 'updatetime', 100)
opt('o', 'viminfo', "'20,<1000,s1000")
opt('w', 'wrap', true)

-- Undo settings

opt('o', 'undodir', '/tmp/.vim-undo-dir')
opt('o', 'undofile', true)
opt('o', 'undolevels', 1000)
opt('o', 'undoreload', 10000)

cmd [[set shortmess-=F]]

cmd [[set foldmethod=expr]]
cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
