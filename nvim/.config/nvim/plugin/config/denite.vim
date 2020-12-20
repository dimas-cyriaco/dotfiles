" Use ripgrep to find files.
call denite#custom#var('file/rec', 'command',
  \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

" Use ripgrep to grep files.
call denite#custom#var('grep', 'command', ['rg'])

call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Ripgrep defaults recommended on the documentation.
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" call denite#custom#option('_',
" 	\ 'max_dynamic_update_candidates', 1000000)

nnoremap <leader>p :Denite -start-filter file/rec<CR>
nnoremap <leader>b :Denite buffer<CR>
nnoremap \ :Denite grep<CR>

augroup denite_settings
  autocmd!

  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> E denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <C-x> denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
  endfunction

  autocmd FileType denite-filter call s:denite_filter_my_settings()
  function! s:denite_filter_my_settings() abort
    inoremap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
  endfunction
augroup END

