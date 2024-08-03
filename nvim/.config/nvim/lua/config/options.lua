local opt = vim.opt

opt.foldcolumn = "1"
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.linebreak = true
opt.list = false
opt.mousescroll = "ver:1,hor:0"
opt.number = true
opt.relativenumber = false
opt.scrolloff = 999
opt.spell = false
opt.spelllang = "en,pt_br"
opt.splitkeep = "screen"
opt.swapfile = false
opt.textwidth = 100
opt.wrap = false

vim.g.root_spec = { "cwd" }

vim.cmd([[let g:kitty_navigator_no_mappings = 1]])
