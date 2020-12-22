let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'modified' ],
      \             [ 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'gitbranch' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineGitBranch',
      \   'mode': 'LightlineMode',
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
        \ &filetype ==# 'coc-explorer' ? '' :
        \ &filetype ==# 'denite-filter' ? '' :
        \ gitbranch#name()
endfunction

function! LightlineMode()
  return &filetype ==# 'denite' ? 'Denite':
        \ &filetype ==# 'coc-explorer' ? 'Explorer' :
        \ &filetype ==# 'denite-filter' ? 'Denite' :
        \ lightline#mode()
endfunction

function! LightlineFilename()
  let file_name = fnamemodify(expand("%"), ":~:.")

  return &filetype ==# 'denite' ? '':
        \ &filetype ==# 'coc-explorer' ? '' :
        \ &filetype ==# 'denite-filter' ? '' :
        \ file_name !=# '' ? file_name : '[No Name]'
endfunction
