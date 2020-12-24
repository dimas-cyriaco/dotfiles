" vim-plug config {{{
call plug#begin()

Plug 'neoclide/coc.nvim',      { 'branch': 'release' }
Plug 'weirongxu/coc-explorer', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-eslint',    { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-eslint',    { 'do': 'yarn install --frozen-lockfile' }
Plug 'iamcco/coc-flutter',     { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-highlight', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-json',      { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-pairs',     { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-prettier',  { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-snippets',  { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-tsserver',  { 'do': 'yarn install --frozen-lockfile' }
Plug 'iamcco/coc-vimlsp',      { 'do': 'yarn install --frozen-lockfile' }
Plug 'dart-lang/dart-vim-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf',           { 'build': './install ' }
Plug 'junegunn/fzf.vim',       { 'depends': 'junegunn/fction-ionzf' }
Plug 'lambdalisue/gina.vim'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'thosakwe/vim-flutter'
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


call plug#end()
" }}}

" Configuraçoes {{{

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
if !isdirectory("/tmp/.vim-undo-dir")
  call mkdir("/tmp/.vim-undo-dir", "", 0700)
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
inoremap <esc><nop>
inoremap <c-c><nop>
nnoremap <silent> \ :GrepProject <cr>

nnoremap <silent><leader>/  :BLines <cr>
nnoremap <silent><leader>a  :CodeActionSelection <cr>
nnoremap <silent><leader>b  :Buffers <cr>
nnoremap <silent><leader>cf :CodeAction <cr>
nnoremap <silent><leader>cl :CodeActionLine <cr>
nnoremap <silent><leader>fD :FlutterVisualDebug <cr>
nnoremap <silent><leader>fR :FlutterHotRestart <cr>
nnoremap <silent><leader>fa :FlutterRun <cr>
nnoremap <silent><leader>fc :FormatSelection <cr>
nnoremap <silent><leader>ff :PrettierAsync <cr>
nnoremap <silent><leader>fo :OpenFloatingExplorer <cr>
nnoremap <silent><leader>fq :FlutterQuit <cr>
nnoremap <silent><leader>fr :FlutterHotReload <cr>
nnoremap <silent><leader>fs :SaveFile <cr>
xmap <leader>ga <Plug>(EasyAlign)
nmap <leader>ga <Plug>(EasyAlign)
nnoremap <silent><leader>gc :GitCommit <cr>
nnoremap <silent><leader>gd :GoToDefinition <cr>
nnoremap <silent><leader>gi :GoToImplementation <cr>
nnoremap <silent><leader>gr :GoToReferences <cr>
nnoremap <silent><leader>gs :GitStatus <cr>
nnoremap <silent><leader>gy :GoToTypeDefinitions <cr>
nnoremap <silent><leader>ie :EditInit <cr>
nnoremap <silent><leader>is :ReloadInit <cr>
nnoremap <silent><leader>la :ListDiagnostics <cr>
nnoremap <silent><leader>p  :Files <cr>
nnoremap <silent><leader>qt :OpenQuickfix <cr>
nnoremap <silent><leader>se :EditSnippets <cr>
nnoremap <silent><leader>sl :ListSnippets <cr>
vnoremap <silent><leader>sm :SortMappingsByKey <cr>
nnoremap <silent><leader>wc :CloseWindow <cr>

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

