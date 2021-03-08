local utils = require('utils')
local cmd = vim.cmd

utils.opt('o', 'termguicolors', true)

cmd [[let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"]]
cmd [[let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"]]

cmd 'colorscheme nord'

cmd [[hi! LspDiagnosticsDefaultError guifg=Red]]
cmd [[hi! LspDiagnosticsDefaultHint guifg=LightGrey]]
cmd [[hi! LspDiagnosticsDefaultInformation guifg=LightBlue]]
cmd [[hi! LspDiagnosticsDefaultWarning guifg=Orange]]
