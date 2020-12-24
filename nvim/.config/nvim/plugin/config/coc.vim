" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

let g:coc_snippet_next = '<tab>'


" Use <c-d> to trigger completion.

" Make <CR> auto-select the first completion item and notify coc.nvim to

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.

" Formatting selected code.


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
command! CodeAction <Plug>(coc-codeaction)
command! CodeActionLine <Plug>(coc-codeaction-line)
command! CodeActionSelection <Plug>(coc-codeaction-selected)
command! EditSnippets CocCommand snippets.editSnippets
command! FormatSelection <Plug>(coc-format-selected)
command! GoToDefinition <Plug>(coc-definition)
command! GoToImplementation <Plug>(coc-implementation)
command! GoToReferences <Plug>(coc-references)
command! GoToTypeDefinitions <Plug>(coc-type-definition)
command! ListDiagnostics CocList diagnostics
command! ListSnippets CocList snippets
command! OpenExplorer CocCommand explorer
command! OpenFloatingExplorer CocCommand explorer --preset floating
command! RefreshCompletions :call coc#refresh()
