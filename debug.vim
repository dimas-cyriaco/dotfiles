call plug#begin(expand('~/.vim/plugged'))
Plug 'arcticicestudio/nord-vim'
call plug#end()

set nocompatible
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme nord

" Run with nvim -u debug.vim
