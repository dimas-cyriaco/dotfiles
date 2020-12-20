" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

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

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-d> to trigger completion.
inoremap <silent><expr> <c-d> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <c-cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent><leader>dn <Plug>(coc-diagnostic-prev)
nmap <silent><leader>dp <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nnoremap <silent><leader>gd :call CocActionAsync('jumpDefinition')<cr>
nnoremap <silent><leader>gy <Plug>(coc-type-definition)
nnoremap <silent><leader>gi <Plug>(coc-implementation)
nnoremap <silent><leader>gr <Plug>(coc-references)

nnoremap <silent><leader>ds :call CocActionAsync('doHover')<cr>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fc  <Plug>(coc-format-selected)
nmap <leader>fc  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>cl  <Plug>(coc-codeaction-line)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>cf  <Plug>(coc-codeaction)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


let g:markdown_fenced_languages = [
    \ 'vim',
    \ 'help'
    \]

nnoremap <leader>sl :CocList snippets<cr>
nnoremap <leader>se :CocCommand snippets.editSnippets<cr>

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB> custom#coc#HandleTab()
" inoremap <silent><TAB> <esc>:TriggerCompletion<cr>i

" Commands
command! OpenExplorer CocCommand explorer
command! TriggerCompletion :call custom#coc#HandleTab()
command! -nargs=0 OrganizeImports :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 Format :call CocAction('format')
command! ListDiagnostics CocList diagnostics
