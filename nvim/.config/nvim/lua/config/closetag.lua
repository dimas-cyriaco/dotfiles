vim.g.closetag_filenames = "*.html,*.jsx,*.tsx"
vim.g.closetag_filetypes = "html,javascript.jsx,typescript.jsx"

vim.cmd [[autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx]]
vim.cmd [[autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx]]
