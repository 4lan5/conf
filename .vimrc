"turn on pathogen
execute pathogen#infect()

set fileformats=unix,dos,mac " support all three, in this order

set enc=utf-8       " Sets the character encoding used inside Vim.
set fenc=utf-8      " Sets the character encoding for the file.
set fencs=ucs-bom,utf-8,cp936,gbk,gb18030,gb2312


set nocompatible "去掉讨厌的有关vim一致性模式,避免以前版本的一些bug和局限.

set number "显示行号

set list  "显示tab" 

filetype on "检测文件的类型

set background=dark "背景颜色暗色.(我觉得不错,保护眼睛.)

syntax on "语法高亮显示.(这个肯定是要的.)

set history=1000 "设置命令历史记录为50条.

set autoindent "使用自动对齐，也就是把当前行的对起格式应用到下一行.

set smartindent "依据上面的对齐格式，智能的选择对齐方式.

set tabstop=4 "设置tab键为4个空格.

set shiftwidth=4 "设置当行之间交错时使用4个空格

set showmatch "设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号

set incsearch "搜索选项.(比如,键入"/bo",光标自动找到一个"bo"所在的位置.)

"set spell "开启英文拼写检查

"解决超长行移动困难
"重新定义<UP><DOWN>
":nmap <UP> gk
":imap <UP> <ESC> gka
":nmap <DOWN> gj
":imap <DOWN> <ESC> gja
":nmap <C-k> : !sdcv <C-R>=expand("<cword>")<CR><CR>



filetype plugin on

"设置markdown高亮插件是否自动折叠
let g:vim_markdown_folding_disabled = 1

"设置markdown预览
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

"设置jedi触发键
let g:jedi#completions_command = "<C-N>"

"设置pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

"设置粘贴模式触发
set pastetoggle=<F9>

if has("vms")
	set nobackup
else
	set backup
endif

"记住打开位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif



autocmd BufNewFile *.sh,*.py exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头
let $author_name = "alans"
let $author_email = "root@4lan5.me"

func SetTitle()
        "如果文件类型为.sh文件
        if &filetype == 'sh'
                call setline(1, "\#!/bin/bash")
                call setline(2, "\# Author:" .$author_name)
                call setline(3, "\# mail:" .$author_email)
                call setline(4, "\# Created : ".strftime("%Y-%m-%d %H:%M:%S"))
                call setline(5, "\# Last Modified : ".strftime("%Y-%m-%d %H:%M:%S"))
                call setline(6, "\# File Name: ".expand("%"))
                call setline(7, "\# Description:")
                call setline(8,"")
        endif
        "如果文件类型为.py文件
        if &filetype == 'python'
                call setline(1, "\#!/usr/bin/env python")
                call setline(2, "\# -*- coding=utf8 -*-")
                call setline(3, "\"\"\"")
                call setline(4, "\# Author:" .$author_name)
                call setline(5, "\# mail:" .$author_email)
                call setline(6, "\# Created : ".strftime("%Y-%m-%d %H:%M:%S"))
                call setline(7, "\# Last Modified : ".strftime("%Y-%m-%d %H:%M:%S"))
                call setline(8, "\# File Name: ".expand("%"))
                call setline(9, "\# Description:")
                call setline(10, "\"\"\"")
                call setline(11,"")
        endif
endfunc
" 自动将光标移动到文件末尾
autocmd BufNewfile * normal G

"SET Last Modified Time START
func DataInsert()
    call cursor(9,1)
    if search ('Last Modified') != 0
        let line = line('.')
        call setline(line, '# Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
    endif
endfunc

autocmd FileWritePre,BufWritePre *.sh,*.py ks|call DataInsert() |'s
"SET Last Modified Time END
