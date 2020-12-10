" Dein configuration {{{
if &compatible
  set NOCOMPATIBLE
endif

set runtimepath+=/Users/dimascyriaco/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/dimascyriaco/.local/share/dein')
  call dein#begin('/Users/dimascyriaco/.local/share/dein')

  call dein#add('/Users/dimascyriaco/.local/share/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('wsdjeg/dein-ui.vim')
  
  call dein#add('reedes/vim-wheel')
  call dein#add('morhetz/gruvbox')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('alvan/vim-closetag')
  call dein#add('neoclide/coc.nvim', { 'rev': 'release' })
  call dein#add('neoclide/coc-json', { 'build': 'yarn install --frozen-lockfile' })
  call dein#add('neoclide/coc-tsserver', { 'build': 'yarn install --frozen-lockfile' })
  call dein#add('neoclide/coc-snippets', { 'build': 'yarn install --frozen-lockfile' })
  call dein#add('prettier/vim-prettier', { 'build': 'yarn install' })
  call dein#add('airblade/vim-gitgutter')
  call dein#add('mhinz/vim-startify')
  call dein#add('lambdalisue/gina.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('itchyny/vim-gitbranch')
  call dein#add('MaxMEllon/vim-jsx-pretty')
  call dein#add('peitalin/vim-jsx-typescript')
  call dein#add('jparise/vim-graphql')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('dart-lang/dart-vim-plugin')
  call dein#add('thosakwe/vim-flutter')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
" }}}

" Configuraçoes {{{

" Leader
let mapleader=" "

" Disable paste
" set nopaste

" Suporte a mouse
set mouse=a

" Habilita número de linhas e linhas relativas
set number
set relativenumber

" Configura cores para gruvbox
colorscheme gruvbox

" Aumenta limite de linhas copiadas
set viminfo='20,<1000,s1000

" Não mostra ultimo comando
set noshowcmd

" Insere espaços no lugar de TABs
set expandtab

" Disable line/column number in status line
set noruler

" Set split direction
set splitright
set splitbelow

" Automatically re-read file if a change was detected outside of vim
set autoread

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Wrap long lines
set wrap

" Disable backup files
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Setup persistent undo
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile
set undolevels=1000
set undoreload=10000
" }}}

" Terminal settings {{{

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

augroup terminal_settings
  autocmd!

  " Terminal settings
  " start terminal in insert mode
  autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END

" open terminal on ctrl+n
function! OpenTerminal()
  vsplit term://zsh
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
" }}}

" Keybinding {{{

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Close window
nnoremap <leader>wc :q<CR>

" Save file
nnoremap <leader>fs :w<CR>
nnoremap ; :
" Convert to uppercase
noremap <c-u> viwU
inoremap <c-u> <esc>viwUea

nnoremap <leader>ie :vsplit $MYVIMRC<CR>
        nnoremap <leader>is :source $MYVIMRC<CR>

inoremap tn <esc>
inoremap <esc> <nop>
inoremap <c-c> <nop>
" noremap : <nop>

nnoremap <leader>. @q

" CoC mappings
nmap <silent><leader> gd <Plug>(coc-definition)
nmap <silent><leader> gy <Plug>(coc-type-definition)
nmap <silent><leader> gi <Plug>(coc-implementation)
nmap <silent><leader> gr <Plug>(coc-references)

" Flutter
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

" Abbreviations
iabbrev @@ dimascyriaco@pm.me

" }}}

" Vim Wheel {{{
let g:wheel#map#mouse = 0
let g:wheel#map#up   = '<M-k>'
let g:wheel#map#down = '<M-j>'
" }}}

" Defx setings {{{

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })

call defx#custom#option('_', {
            \ 'winwidth': 35,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 1,
            \ 'floating_preview': 1,
            \ 'vertical_preview': 1,
            \ 'preview_width': 80,
            \ 'preview_height': 20
            \ })

nnoremap <silent><leader>ft :Defx<CR>
nnoremap <silent><leader>fo :Defx -resume -search=`expand('%:p')` `getcwd()`<CR>zz

augroup defx_settings
  autocmd!

  autocmd FileType defx call s:defx_my_settings()

  function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> o defx#do_action('drop')
    nnoremap <silent><buffer><expr> c defx#do_action('copy')
    nnoremap <silent><buffer><expr> m defx#do_action('move')
    nnoremap <silent><buffer><expr> p defx#do_action('paste')
    nnoremap <silent><buffer><expr> t defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> E defx#do_action('multi', [['open', vsplit], 'quit'])
    nnoremap <silent><buffer><expr> P defx#do_action('preview')
    nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d defx#do_action('remove')
    nnoremap <silent><buffer><expr> r defx#do_action('rename')
    nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
    nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
  endfunction
augroup END

" }}}

" Denite {{{

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
    " inoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
  "   nnoremap <silent><buffer><expr> <Esc>
  "  denite#do_map('quit')
  "   nnoremap <silent><buffer><expr> q denite#do_map('quit')
  "   inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  "   inoremap <silent><buffer><expr> <C-t> denite#do_map('do_action', 'tabopen')
  "   inoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
  "   inoremap <silent><buffer><expr> <C-h> denite#do_map('do_action', 'split')
  endfunction
augroup END

" }}}

" Javascript Settings {{{
augroup javascript_settings
  autocmd!

  autocmd FileType javascript call s:js_settings()
  autocmd FileType javascriptreact call s:js_settings()

  function! s:js_settings() abort
    set shiftwidth=2
  endfunction
augroup END

" Folding

augroup javascript_folding
  autocmd!
  autocmd FileType javascript setlocal foldmethod=syntax
augroup END

" JSX

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"
" }}}

" CoC specific configs {{{

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

augroup coc_settings
  " Use tab for trigger completion with characters ahead and navigate.
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  let g:coc_snippet_next = '<tab>'

  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

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

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>la  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>lo  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>lj  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>lk  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>lp  :<C-u>CocListResume<CR>

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
augroup END
" }}}

" Prettier {{{

let g:prettier#config#config_precedence = 'file-override'
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1

augroup prettier_settings
  autocmd!

  nnoremap <silent><leader>ff :PrettierAsync<cr>
augroup END

" }}}

" Coc Snippet {{{
augroup coc_snippet_settings
  autocmd!

  nnoremap <leader>sl :CocList snippets<cr>
  nnoremap <leader>se :CocCommand snippets.editSnippets<cr>
augroup END
" }}}

" Gina settings {{{

augroup gina_settings
  autocmd!

  nnoremap <silent><leader>gs :Gina status<cr>
  nnoremap <silent><leader>gc :Gina commit<cr>
augroup END

" }}}

" Startify settings {{{

" Don't 'cd' to bookmark dir
let g:startify_change_to_dir = 0

" }}}

" Lightline settings {{{

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'nodeversion', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineGitBranch',
      \   'mode': 'LightlineMode',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'filename': 'LightlineFilename',
      \ },
      \ 'component_function_visible_condition': {
      \   'gitbranch': 1,
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \ },
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'VL',
      \   "\<C-v>": 'VB',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   't': 'T',
      \ },
      \ }

function! LightlineGitBranch()
  return &filetype ==# 'denite' ? '':
        \ &filetype ==# 'denite-filter' ? '' :
        \ &filetype ==# 'defx' ? '' :
        \ gitbranch#name()
endfunction

function! LightlineNodeVersion()
  return system("node --version")[0:-2]
endfunction

function! LightlineMode()
  return &filetype ==# 'denite' ? 'Denite':
        \ &filetype ==# 'denite-filter' ? 'Denite' :
        \ &filetype ==# 'defx' ? 'Defx' :
        \ lightline#mode()
endfunction

function! LightlineFilename()
  return &filetype ==# 'denite' ? '':
        \ &filetype ==# 'denite-filter' ? '' :
        \ &filetype ==# 'defx' ? '' :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" }}}

" Folding Settings {{{
augroup fold_marker_settings
  autocmd!

  autocmd FileType vim,tmux setlocal foldmethod=marker
augroup END
" }}}
