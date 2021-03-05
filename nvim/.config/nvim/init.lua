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
