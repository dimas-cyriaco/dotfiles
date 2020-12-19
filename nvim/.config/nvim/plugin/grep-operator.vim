nnoremap <leader>gg :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>gg :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  silent execute "grep! -R " . shellescape(@@) . " ."
  copen
endfunction
