-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.foldcolumn = '1' -- '0' is not bad
opt.foldenable = true
opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.linebreak = true
opt.list = false
opt.mousescroll = "ver:1,hor:0"
opt.number = true
opt.relativenumber = false
opt.scrolloff = 10
opt.spell = false
opt.spelllang = "en,pt_br"
opt.swapfile = false
opt.textwidth = 100
opt.wrap = false

vim.g.root_spec = { "cwd" }

vim.cmd([[let g:kitty_navigator_no_mappings = 1]])
