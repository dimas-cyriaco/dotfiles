local utils = require('utils')
local map = utils.map

utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')

vim.cmd [[set shortmess+=c]]

vim.g.completion_confirm_key = ""
vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

-- <Tab> to navigate the completion menu
map('<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {mode = 'i', expr = true})
map('<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {mode = 'i', expr = true})

vim.cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]

vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'lsp', 'snippet' } }
  },
}

vim.cmd [[imap <c-j> <Plug>(completion_next_source)]]
vim.cmd [[imap <c-k> <Plug>(completion_prev_source)]]
vim.cmd [[imap <c-d> <Plug>(completion_trigger)]]
