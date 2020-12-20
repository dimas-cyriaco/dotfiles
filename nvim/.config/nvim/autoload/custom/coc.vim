function! custom#coc#HandleTab()
  return pumvisible() ?
  \   coc#_select_confirm() :
  \   coc#expandableOrJumpable() ?
  \     "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \     <SID>check_back_space() ?
  \       "\<TAB>" :
  \       coc#refresh()
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
