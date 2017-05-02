""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vundle 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" All of your Plugins must be added before the following line
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'The-NERD-Tree'
Plugin 'gtags.vim'
Plugin 'taglist.vim'
Plugin 'gccsingle.vim'

Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'mattn/emmet-vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line









""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number        " 显示行号
syntax on         " 语法高亮
set showmatch
""set showcmd       " 显示输入的命令
set ruler         " 显示标尺
""set vb t_vb=
""set incsearch
highlight Comment ctermfg=green guifg=green
highlight Pmenu guifg=green guibg=yy
highlight PmenuSel guifg=green guibg=yy
highlight PmenuSbar guifg=green guibg=yy
highlight PmenuThumb guifg=green guibg=yy

let &termencoding=&encoding
set fileencodings=utf-8,gbk

""set smartindent
set autoindent
""set cindent         " 自动缩进

set tabstop=4       " Tab宽度
set softtabstop=4   " 统一缩进为4
set shiftwidth=4

""set expandtab
set list            " python 中对齐格式用
set listchars=tab:>-,trail:-

set nocompatible    " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限 
set nocp

set mouse =a " 可以使用鼠标

"":set makeprg=gcc\ -Wall\ \ %    " make运行

colorscheme default

inoremap ( ()<LEFT>
inoremap [ []<LEFT>
""inoremap { {<CR>}<ESC>kA<CR>
inoremap { {}<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap jk <RIGHT>
inoremap jf ;<CR>
inoremap jj <esc>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F3> :NERDTree<CR>  
map <c-c> :"+y<CR>   



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"调试
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func CompileRunGcc()
    exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype =='cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	endif
endfunc

map <F8> :call Rungdb<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新文件标题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新建.c,.h,.sh.java文件，自动插入文件头

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java, exec ":call SetTitle()"

func SetTitle()
	if &filetype == 'sh'
		call setline(1, "\#######################################################")
		call append(line("."), "\# File Name:".expand("%"))
		call append(line(".")+1, "\# Auther: ihochang")
		call append(line(".")+2, "\# Mail: yihez@andrew.cmu.edu")
		call append(line(".")+3, "\# Created Time: ".strftime("%c"))
		call append(line(".")+4, "\#######################################################")
		call append(line(".")+5, "\#!/bin/bash")
		call append(line(".")+6, "")
	else
		call setline(1, "/********************************************************")
		
		call append(line("."), "  > File Name:".expand("%"))
		call append(line(".")+1, "  > Auther: ihochang")
		call append(line(".")+2, "  > Mail: yihez@andrew.cmu.edu")

		call append(line(".")+3, "  > Created Time: ".strftime("%c"))
		call append(line(".")+4, " *********************************************************/")
		call append(line(".")+5, "")
	endif

	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif

	if &filetype =='c'
		call append(line(".")+6, "#include<stdio.h>"
		call append(line(".")+7, "")
	endif

	autocmd BufNewFile * normal G

endfunc





