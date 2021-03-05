" vim-plug config {{{
" call plug#begin()

" Plug 'editorconfig/editorconfig-vim'
" Plug 'junegunn/fzf',           { 'build': './install ' }
" Plug 'junegunn/fzf.vim',       { 'depends': 'junegunn/fction-ionzf' }
" Plug 'lambdalisue/gina.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'alvan/vim-closetag'
" Plug 'tpope/vim-commentary'
" Plug 'junegunn/vim-easy-align'
" Plug 'itchyny/vim-gitbranch'
" Plug 'airblade/vim-gitgutter'
" Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'sheerun/vim-polyglot'
" Plug 'prettier/vim-prettier',  { 'do': 'yarn install' }
" Plug 'mhinz/vim-startify'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'reedes/vim-wheel'
" Plug 'liuchengxu/vim-which-key'
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'jiangmiao/auto-pairs'
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" call plug#end()
" " }}}

" " Configuraçoes {{{

scriptencoding utf-8

" let mapleader=" "
" let g:maplocaleader = ','

" set clipboard+=unnamedplus
" set expandtab
" set hidden
" set mouse=a
" set nobackup
" set nohlsearch
" set noruler
" set noshowcmd
" set noshowmode
" set nowritebackup
" set number
" set relativenumber
" set splitright
" set updatetime=100
" set viminfo='20,<1000,s1000
" set wrap

" Setup persistent undo
if !isdirectory('/tmp/.vim-undo-dir')
  call mkdir('/tmp/.vim-undo-dir', '', 0700)
endif

" set undodir=/tmp/.vim-undo-dir
" set undofile
" set undolevels=1000
" set undoreload=10000

" colorscheme nord

" }}}

" Mappings {{{

let g:which_key_map =  {}

" nnoremap ; :
" inoremap tn <esc>
" nnoremap <silent> \ <cmd>Telescope live_grep find_command=rg,--hidden,--files <cr>
let g:which_key_map['\'] = 'Grep project'

" nnoremap <silent><leader>dq :OpenQuickfix <cr>
let g:which_key_map.d = {}
let g:which_key_map.d.q = 'Toogle quickfix'

" nnoremap <silent><leader>w :silent w <cr>
let g:which_key_map.w = 'Save file'

" nnoremap <silent><leader>q :q <cr>
let g:which_key_map.q = 'Quit'

" nnoremap <silent><leader>fo :OpenFloatingExplorer <cr>

nnoremap <silent><leader> :WhichKey '<Space>'<CR>
vnoremap <silent><leader> :silent <c-u> :silent WhichKeyVisual '<Space>' <CR>

" nnoremap <silent><leader>p <cmd>Telescope find_files find_command=rg,--hidden,--files <cr>
let g:which_key_map.p = 'List project files'

" nnoremap <silent><leader>p <cmd>Telescope find_files find_command=rg,--hidden,--files <cr>
" nnoremap <silent><leader>b <cmd>Telescope buffers <cr>
let g:which_key_map.b = 'List open buffers'

" nnoremap <leader>tt :NvimTreeToggle<CR>
" nnoremap <leader>tr :NvimTreeRefresh<CR>
" nnoremap <leader>tn :NvimTreeFindFile<CR>

" let g:which_key_map.g = {
"       \ 'name': '+git',
"       \ 's': [':Gina status', 'Status'],
"       \ 'c': [':Gina commit', 'Commit'],
"   \ }

" let g:which_key_map.n = {
"       \ 'name': '+nvim',
"       \ 'e': [':vsplit $MYVIMRC', 'Edit init.vim in split'],
"       \ 's': [':source $MYVIMRC', 'Source init.vim'],
"   \ }

" let g:which_key_map.t = {
"       \ 'name': '+text',
"       \ 'v': "Align text visually",
"       \ 'a': ['<Plug>(EasyAlign)', 'Align text'],
"       \ 's': [':SortMappingsByKey', 'Source mappings'],
"   \ }
" let g:which_key_map.t.v = 'Align text visually'

" xmap <leader>tv <Plug>(EasyAlign)
command! -range SortMappingsByKey <line1>,<line2>sort /leader/

" call which_key#register('<Space>', "g:which_key_map")

" Abbreviations
" iabbrev @@ dimascyriaco@pm.me

" }}}

" Commands {{{

" command! CloseWindow q
" command! SaveFile w

" }}}

" set completeopt=menuone,noinsert,noselect
" let g:completion_enable_snippet = 'UltiSnips'
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" lua require'lspconfig'.tsserver.setup{}

" let g:closetag_filenames = "*.html,*.jsx,*.tsx"
" let g:closetag_filetypes = "html,javascript.jsx,typescript.jsx"

" autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
" autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

" let g:completion_confirm_key = ""
" inoremap <expr> <cr>    pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<cr>"

" if exists('+termguicolors')
"   let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif

" autocmd BufEnter * lua require'completion'.on_attach()

" luafile ~/.config/nvim/evilline.lua
