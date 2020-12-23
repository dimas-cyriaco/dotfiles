" Dein configuration {{{
set runtimepath+=/Users/dimascyriaco/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/dimascyriaco/.local/share/dein')
  call dein#begin('/Users/dimascyriaco/.local/share/dein')

  call dein#add('/Users/dimascyriaco/.local/share/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('wsdjeg/dein-ui.vim')
  
  call dein#add('reedes/vim-wheel')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tpope/vim-commentary')
  call dein#add('alvan/vim-closetag')
  call dein#add('neoclide/coc.nvim', { 'rev': 'release' })
  call dein#add('neoclide/coc-json', { 'build': 'yarn install --frozen-lockfile' })
  call dein#add('neoclide/coc-tsserver', { 'build': 'yarn install --frozen-lockfile' })
  call dein#add('neoclide/coc-snippets', { 'build': 'yarn install --frozen-lockfile' })
  call dein#add('neoclide/coc-pairs', { 'build': 'yarn install --frozen-lockfile' })
  call dein#add('iamcco/coc-flutter', { 'build': 'yarn install --frozen-lockfile' })
  call dein#add('prettier/vim-prettier', { 'build': 'yarn install' })
  call dein#add('airblade/vim-gitgutter')
  call dein#add('mhinz/vim-startify')
  call dein#add('lambdalisue/gina.vim')
  call dein#add('itchyny/vim-gitbranch')
  call dein#add('MaxMEllon/vim-jsx-pretty')
  call dein#add('peitalin/vim-jsx-typescript')
  call dein#add('jparise/vim-graphql')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('dart-lang/dart-vim-plugin')
  call dein#add('thosakwe/vim-flutter')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('junegunn/fzf', { 'build': './install ' })
  call dein#add('junegunn/fzf.vim', { 'depends': 'junegunn/fction-ionzf' })

  call dein#end()
  call dein#save_state()
endif
" }}}

" Configuraçoes {{{

let mapleader=" "

set clipboard+=unnamedplus
set cmdheight=1
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
inoremap <esc> <nop>
inoremap <c-c> <nop>

nnoremap <silent><leader>/  :BLines<cr>
nnoremap <silent><leader>b  :Buffers<cr>
nnoremap <silent><leader>ds :ShowDocumentation<cr>
nnoremap <silent><leader>fD :FlutterVisualDebug<cr>
nnoremap <silent><leader>fR :FlutterHotRestart<cr>
nnoremap <silent><leader>fa :FlutterRun<cr>
nnoremap <silent><leader>fo :OpenFloatingExplorer<cr>
nnoremap <silent><leader>fq :FlutterQuit<cr>
nnoremap <silent><leader>fr :FlutterHotReload<cr>
nnoremap <silent><leader>fs :SaveFile<cr>
nnoremap <silent><leader>gd :GoToDefinition
nnoremap <silent><leader>gi :GoToImplementation
nnoremap <silent><leader>gr :GoToReferences
nnoremap <silent><leader>gy :GoToTypeDefinitions
nnoremap <silent><leader>ie :EditInit<cr>
nnoremap <silent><leader>is :ReloadInit<cr>
nnoremap <silent><leader>la :ListDiagnostics<cr>
nnoremap <silent><leader>p  :Files<cr>
vnoremap <silent><leader>sm :SortMappingsByKey<cr>
nnoremap <silent><leader>wc :CloseWindow<cr>

nnoremap \ :Rg<cr>
inoremap <silent><expr> <cr> custom#coc#HandleEnter()

" Abbreviations
iabbrev @@ dimascyriaco@pm.me

" }}} 

" Commands {{{

command! -range SortMappingsByKey <line1>,<line2>sort /leader/
command! CloseWindow q
command! EditInit vsplit $MYVIMRC
command! GoToDefinition <Plug>(coc-definition)
command! GoToImplementation <Plug>(coc-implementation)
command! GoToReferences <Plug>(coc-references)
command! GoToTypeDefinitions <Plug>(coc-type-definition)
command! ReloadInit source $MYVIMRC
command! SaveFile w
command! ShowDocumentation call <SID>show_documentation()

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --hidden --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" }}}

