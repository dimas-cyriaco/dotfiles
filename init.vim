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
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'Shougo/vimproc.vim'
Plug 'honza/vim-snippets'
Plug 'vim-ruby/vim-ruby'

call plug#end()

syntax on
colorscheme gruvbox

set background=dark
set clipboard+=unnamedplus
let g:deoplete#enable_at_startup = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" deoplete tab-complete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
imap <C-j> <Plug>(neosnippet_expand_or_jump)

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'
