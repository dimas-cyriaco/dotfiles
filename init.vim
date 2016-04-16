" Dimas Cyriaco

" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'Shougo/unite.vim'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/vimproc.vim'
Plug 'honza/vim-snippets'

for f in split(glob('~/.config/nvim/optionals/*.vim'), '\n')
    exe 'source' f
endfor

call plug#end()
" }}}

" Editor Configs {{{
syntax on
colorscheme gruvbox
set background=dark
set clipboard+=unnamedplus
" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" StatusLine {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" }}}

" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" NeoSnippet {{{
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
let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'
" }}}

" vim:foldmethod=marker:foldlevel=0
