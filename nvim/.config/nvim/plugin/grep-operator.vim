nnoremap <leader>gg :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>gg :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
  let original_unnamed_register = @@

  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[y`]
  else
    return
  endif

  silent execute "grep! -R " . shellescape(@@) . " ."
  copen

  let @@ = original_unnamed_register
endfunction
