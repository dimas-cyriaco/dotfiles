autocmd BufNewFile,BufRead *.gotmpl if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif
