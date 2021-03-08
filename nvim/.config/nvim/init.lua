local fn = vim.fn
local execute = vim.api.nvim_command

require('settings')

-- Auto install Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua
-- End of auto install Packer

vim.g.mapleader = ' '

require('plugins')
require('keymappings')
require('config')
require('lsp')

local utils = require('utils')
local map = utils.map

-- Terminal mappings
map('<leader>tn', '<c-\\><c-n>', {mode = 't'})
vim.cmd [[au BufEnter * if &buftype == 'terminal' | :startinsert | endif]]

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden'
    },
  }
}

vim.cmd [[highlight LspDiagnosticsDefaultError guifg=Red]]
vim.cmd [[highlight LspDiagnosticsDefaultHint guifg=LightGrey]]
vim.cmd [[highlight LspDiagnosticsDefaultInformation guifg=LightBlue]]
vim.cmd [[highlight LspDiagnosticsDefaultWarning guifg=Orange]]

map('<leader>b', ":lua require('config/telescope').buffers()<cr>")
