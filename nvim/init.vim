" Dimas Cyriaco

let mapleader = " "

" Plugins {{{

call plug#begin('~/.config/nvim/plugged')

Plug 'rking/ag.vim'
Plug 'low-ghost/nerdtree-fugitive'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/vimproc.vim'
Plug 'scrooloose/syntastic'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'

call plug#end()
" }}}

" Configs {{{
syntax on
colorscheme gruvbox
set clipboard+=unnamedplus
set noswapfile
set number
set background=dark
set foldmethod=syntax
set nofoldenable
set foldlevel=1
set list listchars=tab:▸\ ,eol:¬,trail:·,tab:»·,extends:.,precedes:.
set shiftwidth=2
" }}}

" Airline {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
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
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" }}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
" }}}

" Fugitive {{{
set previewheight=15 
" }}}

" Mappings {{{
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>so :source %<CR>
nnoremap <silent> <leader>si :source $MYVIMRC<CR>
nnoremap <silent> <leader>ei :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>m :NERDTreeToggle<CR>
nnoremap <silent> <leader>n :BuffergatorToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
nnoremap <silent> <leader>as :NeoSnippetEdit<CR>
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
inoremap jk <esc>
inoremap <esc> <nop>
inoremap <c-c> <nop>
" }}}

" NERDTree {{{
let NERDTreeShowHidden=1
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

set diffopt+=vertical

" vim:foldmethod=marker:foldlevel=0
" vim:set ft=vim et sw=2:
