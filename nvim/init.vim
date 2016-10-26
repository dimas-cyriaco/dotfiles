" Dimas Cyriaco

let mapleader = " "

" Plugins {{{

call plug#begin('~/.config/nvim/plugged')

Plug '907th/vim-auto-save' 
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/vimshell.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'bilalq/lite-dfm'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'nelstrom/vim-markdown-folding'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'romgrk/vimfiler-prompt'
" Plug 'scrooloose/syntastic'
Plug 'ternjs/tern_for_vim'
Plug 'terryma/vim-expand-region'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'xolox/vim-easytags'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-notes'

call plug#end()
" }}}

" Configs {{{
syntax on
colorscheme gruvbox
set background=dark
set clipboard+=unnamedplus
set foldlevel=99
set foldmethod=syntax
set hidden
set list listchars=tab:▸\ ,eol:¬,trail:·,tab:»·,extends:.,precedes:.
set noswapfile
set number
set shiftwidth=2
set title
" }}}

" Vimfiler {{{
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
set fillchars=vert:│,fold:─
let g:vimfiler_tree_leaf_icon = "|"
let g:vimfiler_tree_opened_icon = "▼"
let g:vimfiler_tree_closed_icon = "▷"

autocmd VimEnter * if !argc() | VimFiler | endif
autocmd FileType vimfiler nmap <buffer> i :VimFilerPrompt<CR>

noremap <silent> <Leader>f :VimFiler -split -force-hide -find<CR>
noremap <silent> <Leader>m :VimFiler -split -force-hide -project<CR>
" }}}

" Tagbar {{{
let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
  \ 'h:headings'
  \ ],
  \ 'sort' : 0,
  \ }
nmap <silent> <F8> :TagbarToggle<CR>
" }}}

" Buffergator {{{
let g:buffergator_sort_regime = "filepath"
let g:buffergator_show_full_directory_path = "false"
let g:buffergator_split_size = 60
" }}}

" Airline {{{
" set statusline+=%#warningmsg#
" " set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:airline_powerline_fonts = 1
" let g:airline_theme='wombat'
" let g:airline_mode_map = {
"     \ '__' : '-',
"     \ 'n'  : 'N',
"     \ 'i'  : 'I',
"     \ 'R'  : 'R',
"     \ 'c'  : 'C',
"     \ 'v'  : 'V',
"     \ 'V'  : 'V',
"     \ '' : 'V',
"     \ 's'  : 'S',
"     \ 'S'  : 'S',
"     \ '' : 'S',
"     \ }
" }}}

" Neosnippet {{{
" Enable Deoplete on startup
let g:deoplete#enable_at_startup = 1

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
  \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  \ : (<SID>is_whitespace() ? "\<Tab>"
  \ : deoplete#mappings#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
  \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  \ : (<SID>is_whitespace() ? "\<Tab>"
  \ : deoplete#mappings#manual_complete()))

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:is_whitespace() "{{{
  let col = col('.') - 1
  return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

imap <c-j>     <Plug>(neosnippet_expand_or_jump)
smap <c-j>     <Plug>(neosnippet_expand_or_jump)
xmap <c-j>     <Plug>(neosnippet_expand_target)

" For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif
" }}}

" Syntastic {{{
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']
"
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_warning_symbol = '⚠️'
" let g:syntastic_style_warning_symbol = '💩'
"
" let g:syntastic_javascript_eslint_exec = 'node_modules/eslint/bin/eslint.js'
"
" highlight link SyntasticErrorSign SignColumn
" highlight link SyntasticWarningSign SignColumn
" highlight link SyntasticStyleErrorSign SignColumn
" highlight link SyntasticStyleWarningSign SignColumn
" }}}

" Fugitive {{{
set previewheight=20
" }}}

" Mappings {{{
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>ss :source %<CR>
nnoremap <silent> <leader>si :source $MYVIMRC<CR>
nnoremap <silent> <leader>ei :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>n :BuffergatorToggle<CR>
nnoremap <silent> <leader>as :NeoSnippetEdit<CR>
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
inoremap jk <esc>
inoremap <esc> <nop>
inoremap <c-c> <nop>

if has('nvim')
  nmap <BS> <C-W>h
endif
" }}}

" Javascript syntax {{{
let g:javascript_plugin_flow = 1
let javaScript_fold=1
" }}}

" delimitMate {{{
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1
" }}}

" Vim-notes {{{
" let g:notes_directories = ['~/Dropbox/Notes/Work']
" }}}

" Diff options {{{
set diffopt+=vertical
" }}}

" JSX {{{
let g:jsx_ext_required = 1
" }}}

" Indent pasted text
nnoremap p p=`]

fu! CustomFoldText()
    "get first non-blank line
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

" {{{ Writing mode
autocmd! User GoyoEnter Limelight
func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  setlocal spell spelllang=en_us 
  set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
  let g:limelight_conceal_ctermfg = 'gray'
  let g:limelight_conceal_ctermfg = 240
  Goyo
endfu 
com! WP call WordProcessorMode()
"}}}

" {{{ Auto Save 
let g:auto_save = 1 
let g:auto_save_silent = 1 
" }}} 
