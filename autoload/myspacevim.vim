"=============================================================================
" myspacevim.vim --- SpaceVim for start function
" Copyright (c) 2021 daoyi & Contributors
" Author: 
" URL: https://gitee.com/daotoyi/spacevim.git
" License: GPLv3
"=============================================================================

"instructions{{{
"=============================================================================
" set start function in ~/.SpaceVim.d/init.toml
" bootstrap_before : invoke when load config
" bootstrap_after  : invoke when triger VimEnter
"
"" [options]
""    bootstrap_before = "myspacevim#before"
""    bootstrap_after  = "myspacevim#after"
"=============================================================================
"
"" function! myspacevim#before() abort
""     let g:neomake_c_enabled_makers = ['clang']
""     nnoremap jk <esc>
"" endfunction
"" 
"" function! myspacevim#after() abort
""     iunmap jk
"" endfunction
"" 
"" function! myspacevim#before() abort
""     call SpaceVim#custom#SPCGroupName(['G'], '+TestGroup')
""     call SpaceVim#custom#SPC('nore', ['G', 't'], 'echom 1', 'echomessage 1', 1)
"" endfunction
"}}}
" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"stausline_right_show{{{
"=============================================================================
function! s:add_author_section() abort
  return 'daotoyi'
endfunction
call SpaceVim#layers#core#statusline#register_sections('add_author', function('s:add_author_section'))

" config [options] in ~/.SpaceVim.d/init.toml
" statusline_right_sections = ['fileformat', 'cursorpos', 'percentage', 'add_author']
"}}}

" before{{{
function! myspacevim#before() abort
" init
"=============================================================================
  " on Windows, startup maxizise
  autocmd GUIEnter * simalt ~x
  
  " YouCompleteMe link py3
  " require same bit && pyver betwen vim and py. 
  " set pythonthreedll=python38.dll
  let g:python3_host_prog='D:\Program Files\JetBrains\Anaconda3\python.exe'

  let g:tagbar_ctags_bin = 'C:\Windows\System32\ctags.exe' 

  " fold(another marker)
  set foldenable
  set foldmethod=indent
  set foldlevel=99
  
  " reload files when changed on disk, i.e. via `git checkout`
  set autoread
  set autowriteall			       	" wirte all file when jump other tabs.
  set clipboard+=unnamed        " Vim clipboard share with system. 
 
  set rtp+=~/.SpaceVim.d/autoload/dylayer.vim
  " set rtp+=~\.SpaceVim.d\autoload\dylayer.vim   " or

  cd e:\Refine

" keymapping
"=============================================================================
  " mapping :(input cmd) to ;
  nnoremap ; :
  
  " edit vimr configuration file
  nnoremap confe :e $myvimrc<cr>
  nnoremap confr :source $myvimrc<cr>
  
  nnoremap <leader>ve :e $myvimrc<cr>
  nnoremap <leader>vr :source $myvimrc<cr>
  
endfunction
"}}}

" after{{{
function! myspacevim#after() abort
endfunction
"}}}
