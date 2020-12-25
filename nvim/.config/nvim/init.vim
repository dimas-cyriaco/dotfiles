" vim-plug config {{{
call plug#begin()

Plug 'neoclide/coc.nvim',      { 'branch': 'release' }
Plug 'weirongxu/coc-explorer', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-eslint',    { 'do': 'yarn install --frozen-lockfile' }
Plug 'iamcco/coc-flutter',     { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-highlight', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-json',      { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-pairs',     { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-prettier',  { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-snippets',  { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-tsserver',  { 'do': 'yarn install --frozen-lockfile' }
Plug 'iamcco/coc-vimlsp',      { 'do': 'yarn install --frozen-lockfile' }
Plug 'dart-lang/dart-vim-plugi'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf',           { 'build': './install ' }
Plug 'junegunn/fzf.vim',       { 'depends': 'junegunn/fction-ionzf' }
Plug 'lambdalisue/gina.vim'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'jparise/vim-graphql'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier',  { 'do': 'yarn install' }
Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'reedes/vim-wheel'
Plug 'liuchengxu/vim-which-key'

call plug#end()
" " }}}

" " Configuraçoes {{{

scriptencoding utf-8

let mapleader=" "

set clipboard+=unnamedplus
set expandtab
set mouse=a
set nobackup
set noruler
set noshowcmd
set noshowmode
set nowritebackup
set number
set relativenumber
set splitright
set viminfo='20,<1000,s1000
set wrap

" Setup persistent undo
if !isdirectory('/tmp/.vim-undo-dir')
  call mkdir('/tmp/.vim-undo-dir', '', 0700)
endif

set undodir=/tmp/.vim-undo-dir
set undofile
set undolevels=1000
set undoreload=10000

colorscheme nord

" }}}

" Mappings {{{

nnoremap ; :
inoremap tn <esc>
nnoremap <silent> \ :GrepProject <cr>

" nnoremap <silent><leader>ff :PrettierAsync <cr>
nnoremap <silent><leader>fs :SaveFile <cr>
xmap <leader>ga <Plug>(EasyAlign)
nmap <leader>ga <Plug>(EasyAlign)
nnoremap <silent><leader>gc :GitCommit <cr>
nnoremap <silent><leader>gs :GitStatus <cr>
nnoremap <silent><leader>ie :EditInit <cr>
nnoremap <silent><leader>is :ReloadInit <cr>
nnoremap <silent><leader>qt :OpenQuickfix <cr>
nnoremap <silent><leader>se :EditSnippets <cr>
nnoremap <silent><leader>sl :ListSnippets <cr>
vnoremap <silent><leader>sm :SortMappingsByKey <cr>
nnoremap <silent><leader>wc :CloseWindow <cr>
nnoremap <silent><leader>fo :OpenFloatingExplorer <cr>

nnoremap <silent><leader> :WhichKey '<Space>'<CR>

let g:which_key_map =  {}

nnoremap <silent><leader>p  :Files <cr>
let g:which_key_map.p = 'List project files'

nnoremap <silent><leader>/  :BLines <cr>
let g:which_key_map['/'] = 'Search current file'

nnoremap <silent><leader>b  :Buffers <cr>
let g:which_key_map.b = 'List open buffers'

let g:which_key_map.f = {
      \ 'name' : '+fzf' ,
      \ 'f' : ['Files', 'List project files'],
      \ 'l' : ['BLines', 'Search current file'],
      \ 'b' : ['Buffers', 'List open buffers'],
      \ }

let g:which_key_map.u = {
      \ 'name' : '+flutter',
      \ 'd': ['FlutterVisualDebug', 'Open visual debug'],
      \ 's': ['FlutterHotRestart', 'Hot restart'],
      \ 'a': ['FlutterRun', 'Run'],
      \ 'q': ['FlutterQuit', 'Quit'],
      \ 'r': ['FlutterHotReload', 'Hot reload'],
      \ }

let g:which_key_map.l = {
      \ 'name' : '+lsp',
      \ 'a': ['<Plug>(coc-codeaction-selected)', 'Code action menu for selection'],
      \ 'ab': ['<Plug>(coc-codeaction)', 'Code action menu for buffer'],
      \ 'al': ['<Plug>(coc-codeaction-line)', 'Code action menu for line'],
      \ 'fs': ['<Plug>(coc-format-selected)', 'Format selected code'],
      \ 'f': ['<Plug>(coc-format)', 'Format buffer'],
      \ 'd': ['<Plug>(coc-definition)', 'Go to definition'],
      \ 'i': ['<Plug>(coc-implementation)', 'Go to implementation'],
      \ 'r': ['<Plug>(coc-references)', 'Go to references'],
      \ 't': ['<Plug>(coc-type-definition)', 'Go to type definition'],
      \ 'l': [':CocList diagnostics', 'List diagnostics'],
  \ }

call which_key#register('<Space>', "g:which_key_map")

" Abbreviations
iabbrev @@ dimascyriaco@pm.me

" }}} 

" Commands {{{

command! -range SortMappingsByKey <line1>,<line2>sort /leader/
command! CloseWindow q
command! EditInit vsplit $MYVIMRC
command! ReloadInit source $MYVIMRC
command! SaveFile w

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --hidden --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" }}}

