let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'nodeversion', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineGitBranch',
      \   'mode': 'LightlineMode',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'filename': 'LightlineFilename',
      \ },
      \ 'component_function_visible_condition': {
      \   'gitbranch': 1,
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \ },
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'VL',
      \   "\<C-v>": 'VB',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   't': 'T',
      \ },
      \ }

function! LightlineGitBranch()
  return &filetype ==# 'denite' ? '':
        \ &filetype ==# 'denite-filter' ? '' :
        \ gitbranch#name()
endfunction

function! LightlineNodeVersion()
  return system("node --version")[0:-2]
endfunction

function! LightlineMode()
  return &filetype ==# 'denite' ? 'Denite':
        \ &filetype ==# 'denite-filter' ? 'Denite' :
        \ lightline#mode()
endfunction

function! LightlineFilename()
  return &filetype ==# 'denite' ? '':
        \ &filetype ==# 'denite-filter' ? '' :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
