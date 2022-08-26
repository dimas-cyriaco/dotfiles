lvim.format_on_save = true
lvim.log.level = "warn"
lvim.leader = ";"
-- vim.o.laststatus = 3
-- vim.cmd[[set laststatus=2]]

lvim.builtin.alpha.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.bufferline.active = true

require "user.lsp"
require "user.treesitter"
require "user.plugins"
require "user.telescope"
require "user.luasnip-config"
require "user.folding"
require "user.keymaps"
require "user.snippets"

require('kanagawa').setup({
  -- dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
  globalStatus = true, -- adjust window separators highlight for laststatus=3
})

vim.cmd("colorscheme kanagawa")
lvim.colorscheme = "kanagawa"

vim.opt.fillchars = {
  horiz     = '━',
  horizup   = '┻',
  horizdown = '┳',
  vert      = '┃',
  vertleft  = '┫',
  vertright = '┣',
  verthoriz = '╋',
}
