" TextEdit might fail if hidden is not set.
set hidden

set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

let g:coc_snippet_next = '<tab>'

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:markdown_fenced_languages = [
    \ 'vim',
    \ 'help'
    \]

let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\     'sources': [{'name': 'file', 'expand': v:true}]
\   },
\   'default': {
\     'sources': [{'name': 'file', 'expand': v:true}],
\     'width': 32
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent><leader>h :call CocActionAsync('doHover')<cr>
inoremap <silent><expr><c-e> CocActionAsync('showSignatureHelp')
inoremap <silent><expr><cr> custom#coc#HandleEnter()
inoremap <silent><expr><c-d> coc#refresh()
inoremap <silent><expr><c-d> coc#refresh()
tnoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr><TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ custom#coc#check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Commands
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OrganizeImports :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! EditSnippets CocCommand snippets.editSnippets
command! ListDiagnostics CocList diagnostics
command! ListSnippets CocList snippets
command! OpenExplorer CocCommand explorer
command! OpenFloatingExplorer CocCommand explorer --preset floating
command! RefreshCompletions :call coc#refresh()
