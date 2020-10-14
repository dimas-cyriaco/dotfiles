if &compatible
  set NOCOMPATIBLE
endif

set runtimepath+=/Users/dimascyriaco/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/dimascyriaco/.local/share/dein')
  call dein#begin('/Users/dimascyriaco/.local/share/dein')

  call dein#add('/Users/dimascyriaco/.local/share/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('reedes/vim-wheel')
  call dein#add('morhetz/gruvbox')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tpope/vim-commentary')
  " call dein#add('pangloss/vim-javascript.git')
  " call dein#add('MaxMEllon/vim-jsx-pretty')
  call dein#add('tpope/vim-surround')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('alvan/vim-closetag')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" Configuraçoes

" Leader
let mapleader=" "

" Mouse support
set mouse=a

" Set relative line numbers
set number
set relativenumber

" Set color scheme to gruvbox
colorscheme gruvbox

" Don't show last command
set noshowcmd

" Insert spaces when TAB is pressed.
set expandtab

" Disable line/column number in status line
set noruler

" Set split direction
set splitright
set splitbelow

" Automatically re-read file if a change was detected outside of vim
set autoread

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Wrap long lines
set wrap

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" Terminal settings
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  vsplit term://zsh
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" Movement
" TODO: Mudar o leader quando for terminal para nao ser <SPACE>
tnoremap <leader>h <C-\><C-n><C-w>h
tnoremap <leader>j <C-\><C-n><C-w>j
tnoremap <leader>k <C-\><C-n><C-w>k
tnoremap <leader>l <C-\><C-n><C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Keybinding

" Close window
nnoremap <leader>wq :q<CR>

" Save file
nnoremap <leader>fs :w<CR>
nnoremap ; :
" Convert to uppercase
noremap <c-u> viwU
inoremap <c-u> <esc>viwUea

nnoremap <leader>ie :vsplit $MYVIMRC<CR>
        nnoremap <leader>is :source $MYVIMRC<CR>

inoremap tn <esc>
inoremap <esc> <nop>
inoremap <c-c> <nop>
inoremap : <nop>

nnoremap <leader>. @q

" Abbreviations
iabbrev @@ dimascyriaco@pm.me

" File Explorer

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })

call defx#custom#option('_', {
            \ 'winwidth': 35,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 1,
            \ 'floating_preview': 1,
            \ 'vertical_preview': 1,
            \ 'preview_width': 80,
            \ 'preview_height': 20
            \ })

nnoremap <leader>ft :Defx<CR>
nnoremap <leader>fo :Defx `expand('%:p:h')` -search=`expand('%:p')`<CR>

" function! s:map_defx(key, action)
  " nnoremap <silent><buffer><expr> key action
" endfunction

augroup defx_settings
  autocmd!

  autocmd FileType defx call s:defx_my_settings()

  function! s:defx_my_settings() abort
    " Define mappings
    " call s:map_defx(<CR> defx#do_action('open'))
    nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
    nnoremap <silent><buffer><expr> c defx#do_action('copy')
    nnoremap <silent><buffer><expr> m defx#do_action('move')
    nnoremap <silent><buffer><expr> p defx#do_action('paste')
    nnoremap <silent><buffer><expr> l defx#do_action('open')
    nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P defx#do_action('preview')
    nnoremap <silent><buffer><expr> o defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns',                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d defx#do_action('remove')
    nnoremap <silent><buffer><expr> r defx#do_action('rename')
    nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
    nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
  endfunction
augroup END

" Denite

" Use ripgrep to find files.
call denite#custom#var('file/rec', 'command',
	\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

" Use ripgrep to grep files.
call denite#custom#var('grep', 'command', ['rg'])

call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Ripgrep defaults recommended on the documentation.
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" \ 'split': 'floating',
" let s:denite_options = {'default' : {
" \ 'start_filter': 1,
" \ 'auto_resize': 1,
" \ 'source_names': 'short',
" \ 'prompt': '🔍',
" \ 'winrow': 1,
" \ 'vertical_preview': 1
" \ }}

" try
" " Loop through denite options and enable them
" function! s:profile(opts) abort
"   for l:fname in keys(a:opts)
"     for l:dopt in keys(a:opts[l:fname])
"       call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
"     endfor
"   endfor
" endfunction

" call s:profile(s:denite_options)
" catch
"   echo 'Denite not installed. It should work after running :PlugInstall'
" endtry

" call denite#custom#source('file/rec', 'sorters', ['sorter_sublime'])
" call denite#custom#option('_',
" 	\ 'max_dynamic_update_candidates', 1000000)

nnoremap <leader>p :Denite -start-filter file/rec<CR>
nnoremap <leader>b :Denite buffer<CR>
nnoremap \ :Denite grep<CR>

augroup denite_settings
  autocmd!

  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <C-x> denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
  endfunction

  " autocmd FileType denite-filter call s:denite_filter_my_settings()
  " function! s:denite_filter_my_settings() abort
  "   inoremap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
  "   inoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
  "   nnoremap <silent><buffer><expr> <Esc>
  "  denite#do_map('quit')
  "   nnoremap <silent><buffer><expr> q denite#do_map('quit')
  "   inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  "   inoremap <silent><buffer><expr> <C-t> denite#do_map('do_action', 'tabopen')
  "   inoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
  "   inoremap <silent><buffer><expr> <C-h> denite#do_map('do_action', 'split')
  " endfunction
augroup END


augroup javascript_settings
  autocmd!

  autocmd FileType javascript call s:js_settings()
  autocmd FileType javascriptreact call s:js_settings()

  function! s:js_settings() abort
    set shiftwidth=2
  endfunction
augroup END

" Folding

augroup javascript_folding
    autocmd!
    autocmd FileType javascript setlocal foldmethod=syntax
augroup END

" JSX

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"
