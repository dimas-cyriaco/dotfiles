-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.foldcolumn = "1" -- '0' is not bad
opt.foldenable = true
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.linebreak = true
opt.list = false
opt.mousescroll = "ver:1,hor:0"
opt.number = true
opt.relativenumber = false
-- opt.scrolloff = 999
opt.spell = false
opt.spelllang = "en,pt_br"
opt.swapfile = false
opt.textwidth = 100
opt.wrap = false

vim.g.root_spec = { "cwd" }

vim.cmd([[let g:kitty_navigator_no_mappings = 1]])

-- views can only be fully collapsed with the global statusline
-- vim.opt.laststatus = 3
-- Default splitting will cause your main splits to jump when opening an edgebar.
-- To prevent this, set `splitkeep` to either `screen` or `topline`.
vim.opt.splitkeep = "screen"

-- if vim.g.neovide then
--   -- Put anything you want to happen only in Neovide here
--   vim.o.guifont = "JetBrainsMono Nerd Font:h16" -- text below applies for VimScript
-- end
