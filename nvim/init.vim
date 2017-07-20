if &compatible
  set nocompatible
endif

set runtimepath+=/home/dimas/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/dimas/.cache/dein')
  call dein#begin('/home/dimas/.cache/dein')

  call dein#add('/home/dimas/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  call dein#add('morhetz/gruvbox')
  call dein#add('mhinz/vim-startify')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neco-syntax')
  call dein#add('5t111111/denite-rails')
  call dein#add('Raimondi/delimitMate')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('ternjs/tern_for_vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-repeat')
  call dein#add('reedes/vim-wheel')
  call dein#add('majutsushi/tagbar')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tpope/vim-surround')
  call dein#add('lambdalisue/gina.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('neomake/neomake')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

let mapleader = " "

" Configs {{{
syntax on
colorscheme gruvbox
set background=dark
set clipboard+=unnamedplus
set cursorline
set foldenable
set foldlevel=99
set foldmethod=syntax
set hidden
set noswapfile
set number
set relativenumber
set shiftwidth=2
set splitright
set title
" }}}

" Mappings {{{
nnoremap <silent> <leader>w  :w<CR>
nnoremap <silent> <leader>q  :q<CR>
nnoremap <silent> <leader>ss :source %<CR>
nnoremap <silent> <leader>si :source $MYVIMRC<CR>
nnoremap <silent> <leader>ei :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>di :call dein#install()<CR>
nnoremap <silent> <leader>as :NeoSnippetEdit<CR>
nnoremap <silent> <leader>p  :Denite file_rec -reversed<CR>
nnoremap <silent> <leader>n  :Denite buffer -mode=normal -reversed<CR>
nnoremap <silent> <leader>g  :Denite grep -mode=normal -reversed<CR>
nnoremap <silent> <leader>z0 :set foldlevel=0<CR>
nnoremap <silent> <leader>z1 :set foldlevel=1<CR>
nnoremap <silent> <leader>z2 :set foldlevel=2<CR>
nnoremap <silent> <leader>z9 :set foldlevel=9<CR>
nnoremap <silent> <leader>h <c-w>h
nnoremap <silent> <leader>j <c-w>j
nnoremap <silent> <leader>k <c-w>k
nnoremap <silent> <leader>l <c-w>l
nnoremap <silent> <leader>tf ?it(<CR>if<esc>:noh<CR>
nnoremap <silent> <leader>tu ?fit(<CR>x:noh<CR>
nnoremap <silent> <leader>zz zMzvzazA
nnoremap ; :

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <esc> <nop>
inoremap <c-c> <nop>
inoremap jk <esc>
imap <C-j> <Plug>(neosnippet_expand_or_jump)
inoremap <expr><TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" }}}

let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1

fu! CustomFoldText()
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let lineCount = line("$")
  let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
  let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf
set foldtext=CustomFoldText()

let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1

nnoremap <silent> <Leader>f :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit -find -project<CR>
nnoremap <silent> <Leader>m :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
nnoremap <silent> <F9> :VimFilerExplorer -project<CR>

call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')
call denite#custom#option('_', 'highlight_matched_range', 'None')
call denite#custom#option('_', 'highlight_matched_char', 'Underlined')

nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Indent pasted text
nnoremap <silent> p p=`]

let g:gitgutter_map_keys = 0

let g:neomake_rspec_maker = { 'exe': 'bundle', 'args': ['exec', 'rspec'] }
let g:neomake_rmtemp_maker = { 'exe': 'rm', 'args': ['-r', 'tmp/capybara'] }
let g:neomake_javascript_eslint_maker = {
      \ 'exe': './node_modules/.bin/eslint',
      \ 'args': ['--verbose']
      \ }
let g:neomake_javascript_enabled_makers = ['eslint']

function! UpdateJavascriptTags() abort
  execute '!find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'
endfunction
nnoremap <leader>ujt :call UpdateJavascriptTags()<CR>
autocmd BufNewFile,BufRead *.rb set makeprg=rake

