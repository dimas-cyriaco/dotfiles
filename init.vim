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
set noswapfile
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
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)
" }}}

" vim:foldmethod=marker:foldlevel=0
