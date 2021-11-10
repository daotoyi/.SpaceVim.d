"=============================================================================
" dylayer.vim --- SpaceVim daoyi custom layer
" Copyright (c) 2021 daoyi & Contributors
" Author: 
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

" basic_config{{{
"=============================================================================
" on Windows, startup maxizise
autocmd GUIEnter * simalt ~x

" require same bit && pyver betwen vim and py. 
" set pythonthreedll=python38.dll
let g:python3_host_prog='D:\Program Files\JetBrains\Anaconda3\python.exe'

" fold(another marker)
set foldenable
set foldmethod=indent
set foldlevel=99

" reload files when changed on disk, i.e. via `git checkout`
set autoread
set autowriteall			       	" wirte all file when jump other tabs.
set clipboard+=unnamed        " Vim clipboard share with system. 

cd e:\Refine
"}}}

" keymapping{{{
"=============================================================================
" mapping :(input cmd) to ;
nnoremap ; :

" edit vimr configuration file
nnoremap confe :e $myvimrc<cr>
nnoremap <leader>ve :e $myvimrc<cr>

" reload vims configuration file
nnoremap confr :source $myvimrc<cr>
nnoremap <leader>vr :source $myvimrc<cr>
"}}}

" OmniCppComplete{{{
"=============================================================================
" auto complete 
"" set completeopt=longest,menu,menuone
"" let g:ale_completion_delay = 500
"" 
"" autocmd FileType python set omnifunc=pythoncomplete#Complete 
"" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS 
"" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 
"" autocmd FileType css set omnifunc=csscomplete#CompleteCSS 
"" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags 
"" autocmd FileType php set omnifunc=phpcomplete#CompletePHP 
"" autocmd FileType c set omnifunc=ccomplete#Complete 
"" 
"" let OmniCpp_NamespaceSearch = 1
"" let OmniCpp_GlobalScopeSearch = 1
"" let OmniCpp_ShowAccess = 1
"" let OmniCpp_ShowPrototypeInAbbr = 1 	" show list of function paramter"
"" let OmniCpp_MayCompleteDot = 1   		" after press .  ;auto-complete"
"" let OmniCpp_MayCompleteArrow = 1 		" after press -> ;auto-complete"
"" let OmniCpp_MayCompleteScope = 1 		" after press :: ;auto-complete"
"" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" 
"" " close complete window auto"
"" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif		
"}}}

" function{{{
"=============================================================================
function! SpaceVim#layers#dylayer#plugins() abort
    let plugins = []
    call add(plugins, ['tomasr/molokai', {'merged' : 0}])
    call add(plugins, ['vim-scripts/OmniCppComplete', {'merged' : 0}])
    call add(plugins, ['jceb/vim-orgmode', {'merged' : 0}])
    call add(plugins, ['mattn/calendar-vim', {'merged' : 0}])
    call add(plugins, ['tpope/vim-speeddating', {'merged' : 0}])
    call add(plugins, ['coolwanglu/neovim-python-client', {'merged' : 0}])
    return plugins
endfunction"
" }}}

" markdown{{{
"=============================================================================
set wrap

"v开头为自定义快捷键
call SpaceVim#custom#SPCGroupName(['v'], '+Personal Key Bindings')

"使用v-p进行markdown网页预览
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} call SpaceVim#custom#SPC('nore', ['v', 'p'], ':!google-chrome-stable "%:p"', 'Markdown-Previews',1)

"对markdown进行行注释，在行首插入[//]:#(,在行尾插入右括号),命令是'I[//]:#(<Esc>A)<Esc>',注意这里的<Esc>要用Ctrl-Esc来完成 
call SpaceVim#custom#SPC('nore', ['v', 'c'], 'I[//]:#(<Esc>A)<Esc>', 'Markdown-comment one line', 0)

"对markdown取消行注释,在行首删除[//]:#(,在行尾删除右括号)
call SpaceVim#custom#SPC('nore', ['v', 'u'], '07x$x', 'Markdown-uncomment one line', 0)
"}}}
