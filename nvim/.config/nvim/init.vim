syntax enable

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
  call dein#add('Shougo/denite.nvim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tpope/vim-commentary')
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
  call dein#add('lifepillar/vim-gruvbox8')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

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
set background=dark
colorscheme gruvbox8

" highlight! link SignColumn LineNr
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green ctermbg=NONE
highlight GitGutterChange ctermfg=yellow ctermbg=NONE
highlight GitGutterDelete ctermfg=red ctermbg=NONE
highlight GitGutterChangeDelete ctermfg=yellow ctermbg=NONE

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

autocmd! bufwritepost init.vim source %
" }}}

" Keybinding {{{

" Adiciona ; no final da linha
nnoremap <silent><leader>; :execute "normal! mqA;\<lt>esc>`q"<cr>
nnoremap <silent><leader>fo :OpenExplorer<cr>

" Show documentation
" nnoremap <silent>K :call <SID>show_documentation()<CR>

" Close window
nnoremap <leader>wc :q<CR>

" Save file
nnoremap <leader>fs :w<CR>
nnoremap ; :

" Convert to uppercase
noremap <c-u> viwU
inoremap <c-u> <esc>viwUea

" Abre o init.vim
nnoremap <leader>ie :vsplit $MYVIMRC<CR>

" Source init.vim
nnoremap <leader>is :source $MYVIMRC<CR>

" nnoremap <silent><leader>gg :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

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

nnoremap <silent><space>la :ListDiagnostics<cr>

" Abbreviations
iabbrev @@ dimascyriaco@pm.me

" }}}
