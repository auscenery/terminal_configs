set nocompatible "关闭vi的一致性模式，避免以前版本的一些Bug和局限

syntax enable "开启语法高亮
syntax on

filetype on " 检测文件类型
filetype plugin on "开启插件，加载vim自带和插件相应的语法和文件类型相关脚本
filetype indent on "针对不同的文件，采用不同的缩进方式

set backspace=2 "mac 独有的问题 http://cenalulu.github.io/linux/why-my-backspace-not-work-in-vim/
"等价于 set backspace=indent,eol,start"

set nopaste "原样复制

set encoding=utf-8 " 设置编码

set number "显示行号
set relativenumber  "相对行数

set cursorline "高亮显示当前行/列
set cursorcolumn

set hlsearch "搜索高亮显示
set incsearch

set autoindent "自动缩进
set smarttab "让vim把连续数量的空格视为一个制表符
set expandtab "将制表符扩展为空格
set tabstop=4 "设定 tab 长度为 4
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格

set mouse=a "打开鼠标模式
set nonu "不需要复制行号
set selection=exclusive
set selectmode=mouse,key

set ignorecase " 设置搜索时忽略大小写set incsearch

set smartcase  " 当搜索的时候尝试smart 

set foldenable  " 允许折叠
set foldmarker=//{{{,//}}} """通过zc 折叠代码，zo展开
set fdm=marker
set nowrap  "设置不折行"
"set foldmethod=indent  "或者set fdm=indent, 根据代码缩进进行折叠

set wildignore+=*DS_Store*

set showcmd "在状态栏显示正在输入的命令
set showmode "左下角显示当前Vim模式
set ruler " 显示当前行号和列号
set showmatch " 设置代码匹配,包括括号匹配情况


set ignorecase      "忽略大小写"
set cursorline      "突出显示当前行"
set cursorcolumn    "突出显示当前列"

set maxmempattern=20000 "vim 提示 E363: uses more memory than 'maxmempattern'?
"set ch=1
"set statusline=%F\ [%{&fenc}\ %{&ff}\ L%l/%L\ C%c]\ %=%{strftime('%Y-%m-%d\ %H:%M')} "设置状态行
set laststatus=2
set wildmenu             " vim自身命名行模式智能补全
set autowrite           " 设置自动保存
set autoread            " 文件在vim之外修改过，自动重新读入
set confirm             " 在处理未保存或只读文件的时候，弹出确认

" map前缀 
let mapleader = ","
"快速打开.vimrc文件
"快速使得.vimrc文件生效 <CR>为enter键
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR> 
"恢复操作
nnoremap <leader>u <c-r> 

"代替esc键
inoremap jk <ESC>
inoremap JK <ESC>
inoremap KJ <ESC>
inoremap kj <ESC>

"inoremap <esc> <nop>, 会触发其他副作用，比如箭头方向移动乱码
"括号内都删除, 比如dp, cp
onoremap p i(

"fast close window
nnoremap <silent><leader>q :quit<CR>
vnoremap <silent><leader>q :quit<CR>

"窗口切换, 参考http://cn.voidcc.com/question/p-zaioucxu-bev.html
nnoremap <leader>n <C-w><C-w>
nnoremap <leader>N <C-w><C-w>
vnoremap <silent><leader>n <C-w><C-w>
vnoremap <silent><leader>N <C-w><C-w>

" Fast saving
nnoremap <silent><Leader>w :write<CR>
vnoremap <silent><Leader>w <Esc>:write<CR>
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i

"*********************************plugin*******************************************

"流行插件参考https://vimawesome.com/plugin
"插件管理工具有pathogen, vundle, neobundle, vimPlug等, 选择一种即可

"pathogen管理插件
" pathogen让每个插件占有一个单独的目录，解决了文件分散的问题,
" 参考https://github.com/tpope/vim-pathogen
"set rtp+=~/.vim/bundle/vim-pathogen
"source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim "二选一，两种方法，set或者source
"execute
"pathogen#infect()
"vundle 管理插件
" set the runtime path to include Vundle and initialize
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
"1.https://github.com/VundleVim/Vundle.vim
Plugin 'VundleVim/Vundle.vim' "通过制定github的用户名/项目名即可，https://github.com/VundleVim/Vundle.vim#about, 生效
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件

"2.https://github.com/scrooloose/nerdtree, 文件导航, 已经生效，非常好用
Plugin 'scrooloose/nerdtree'

"3.https://vimawesome.com/plugin/the-nerd-commenter， 快速加上注释和去掉注释,
"生效，非常好用
"<leader>cc   加注释
" <leader>cu   解开注释
" <leader>c<space>  加上/解开注释, 智能判断
" <leader>cy   先复制, 再注解(p可以进行黏贴)
 Plugin 'scrooloose/nerdcommenter'

"4.https://vimawesome.com/plugin/vim-snippets, 减少按键次数, 减轻记忆负担,非常强大，值得拥有，生效
"大家在在编程的过程中不可避免的需要敲大量的重复的代码结构。而作为程序员，很重要的一个意识，就是要坚持实践 DRY 原则。
"使用 snippets 类的插件，可以通过自定义代码片段的方式来提高效率。
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

"5.https://vimawesome.com/plugin/emmet-vim, 能大幅度提高前端开发效率的一个工具
Plugin 'mattn/emmet-vim'

"6.https://vimawesome.com/plugin/vim-colors-solarized-ours, 现在最流行的 Vim
"主题, 生效
Plugin 'altercation/vim-colors-solarized'

"7.https://vimawesome.com/plugin/fugitive-vim git 的包装，一个非常优秀的、
"集成了各种git操作的Vim插件,生效
Plugin 'tpope/vim-fugitive'

"8.https://vimawesome.com/plugin/surround-vim, 生效, 非常有用
"作用: 快速给词加环绕符号,例如单引号/双引号/括号/成对标签等
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

"9.http://github.com/davidhalter/jedi-vim,生效, 非常有用, python代码智能提示
" 需要安装jedi， pip install jedi
Plugin 'davidhalter/jedi-vim'

"10.https://vimawesome.com/plugin/powerline-red
"Plugin 'powerline/powerline'
"https://github.com/vim-airline/vim-airline (very good)，
"生效，非常有用，状态栏
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"11.https://vimawesome.com/plugin/indentline, 生效,缩进指示 
Plugin 'yggdroot/indentline'

"12.https://github.com/nathanaelkane/vim-indent-guides, 生效
Plugin 'nathanaelkane/vim-indent-guides'

"13.https://vimawesome.com/plugin/vim-autopep8 (生效), python代码规范检查
Plugin 'tell-k/vim-autopep8'

"14.https://github.com/jiangmiao/auto-pairs(生效, 在nopaste设置下生效, 括号匹配)
Plugin 'jiangmiao/auto-pairs'

"15.https://vimawesome.com/plugin/python-vim-red,生效
Plugin 'hdima/python-syntax'

"16.supertab https://vimawesome.com/plugin/supertab, 超赞，生效了
Plugin 'ervandew/supertab'

"17.https://vimawesome.com/plugin/ctrlp-vim-red,快速查找,生效了，非常好用
Plugin 'kien/ctrlp.vim'

"18 https://vimawesome.com/plugin/vim-flake8, python代码规范检查插件，
"需要提前pip install flake8, 赞，超强，比autopep8好
"lake8是集成了pyflakes和pycodestyle，其中，pyflakes检查代码错误；
"pycodestyle检查代码是否遵循Python编码规范（PEP8），
"其取代了pep8，后者已经不再更新. 该插件超棒
Plugin 'nvie/vim-flake8'

"https://vimawesome.com/plugin/syntastic， 提示各种语言语法错误
"Plugin 'scrooloose/syntastic'

"https://vimawesome.com/plugin/vim-go-sparks-fly
"Plugin 'fatih/vim-go'

"https://vimawesome.com/plugin/youcompleteme, 代码补全
"Plugin 'valloric/youcompleteme'

call vundle#end()
filetype plugin indent on

"*********************************plugin*******************************************


"*********************************plugin config*******************************************
"NERDTree config
map nd :NERDTree
map nc :NERDTreeClose
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"
map <F2> :NERDTreeToggle<CR>

"Syntastic settings https://github.com/moolighty/syntastic
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"https://github.com/scrooloose/nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

"https://github.com/honza/vim-snippets
let g:snipMate = {}
let g:snipMate.scope_aliases = {}

"缩进指示线" intentline
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1

"airline
let g:airline#extensions#tabline#enabled = 1    " buffers设置
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#formatter = 'jsformatter'
"let g:airline_statusline_ontop=1

"autopep8
let g:autopep8_on_save = 1
let g:autopep8_max_line_length=79
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
let g:AutoPairs['<']='>'
let g:AutoPairsShortcutToggle = '<M-p>'
let g:AutoPairsShortcutFastWrap = '<M-e>'
let g:AutoPairsShortcutJump = '<M-n>'
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsMapCR = 1
let g:AutoPairsMapBS = 1

"vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 0 "控制是否启用
"从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1

"jedi-vim
let g:jedi#use_tabs_not_buffers = 1 "You can make jedi-vim use tabs when going to a definition et
let g:jedi#use_splits_not_buffers = "left" "If you are a person who likes to use VIM-splits, you might want to put this in your .vimrc:
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<leader>o"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
"I don't want the docstring window to popup during completion
autocmd FileType python setlocal completeopt-=preview 
let g:jedi#popup_on_dot = 0
"let g:jedi#completions_enabled = 0

"vim-colors-solarized插件
"set background=dark
set background=light
set t_Co=256 " 开启256色支持
colorscheme molokai
"colorscheme solarized

"python syntax
let OPTION_NAME = 1
let python_highlight_all = 1

"supertab
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 设置过滤不进行查找的后缀名
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'"

"flake
let g:flake8_error_marker='EE'     " set error marker to 'EE'
let g:flake8_warning_marker='WW'   " set warning marker to 'WW'
"let g:flake8_pyflake_marker=''     " disable PyFlakes warnings
"let g:flake8_complexity_marker=''  " disable McCabe complexity warnings
"let g:flake8_naming_marker=''      " disable naming warnings
" to use colors defined in the colorscheme
"highlight link Flake8_Error      Error
"highlight link Flake8_Warning    WarningMsg
"highlight link Flake8_Complexity WarningMsg
"highlight link Flake8_Naming     WarningMsg
"highlight link Flake8_PyFlake    WarningMsg
let g:flake8_quickfix_height=20
" autocmd FileType python set breakindentopt=shift:4
autocmd FileType python map <buffer> <leader><leader>  :call flake8#Flake8()<CR>
autocmd BufWritePost *.py call flake8#Flake8()


"*********************************plugin config*******************************************

""""""""""""""""""""""""""""""""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.py,*.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

func! SetHeader()
    call setline(1, "/*************************************************************************")
    call setline(2, "\# File Name: ".expand("%"))
    call setline(3, "\# Author: Chuanjian Liang")
    call setline(4, "\# Mail: moolighty@yahoo.com")
    call setline(5, "\# Created Time: ".strftime("%c"))
    call setline(6, " ************************************************************************/")
    call setline(7, "")
endfunc

func! SetScriptComment(lineno)
    call setline(a:lineno, "\#########################################################################")
    call setline(a:lineno + 1, "\# File Name: ".expand("%"))
    call setline(a:lineno + 2, "\# Author: Chuanjian Liang")
    call setline(a:lineno + 3, "\# Mail: moolighty@yahoo.com")
    call setline(a:lineno + 4, "\# Created Time: ".strftime("%c"))
    call setline(a:lineno + 5, "\#########################################################################")
    call setline(a:lineno + 6, "")
endfunc

""定义函数SetTitle，自动插入文件头
func! SetTitle()
    "如果文件类型为.py文件
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "# -*- coding:utf-8 -*-")
        call setline(3, "")
        call SetScriptComment(4)
        call setline(5 + 6, "")
        call setline(6 + 6, 'if __name__ == "__main__":')
        call setline(7 + 6, '    print("hello world!")')
    "如果文件类型为.sh文件
    elseif &filetype == 'sh'
        call setline(1, "\#!/usr/bin/env bash")
        call setline(2, "")
        call SetScriptComment(3)
        call setline(4 + 6, 'echo "hello world!"')
        call setline(5 + 6, "")
    elseif &filetype == 'c'
        call SetHeader()
        call setline(8, "#include <stdio.h>")
        call setline(9, "")
        call setline(10, "int main(int argc, char *argv[])")
        call setline(11, "{")
        call setline(12, '    printf("Hello world!\n");')
        call setline(13, "    return 0;")
        call setline(14, "}")
    elseif expand("%:e") == 'h'
        call SetHeader()
        call setline(8, "#ifndef __".toupper(expand("%:r"))."_H__")
        call setline(9, "#define __".toupper(expand("%:r"))."_H__")
        call setline(10, "")
        call setline(11, "#endif")
        call setline(12, "")
    elseif &filetype == 'cpp'
        call SetHeader()
        call setline(8, "#include <iostream>")
        call setline(9, "using namespace std;")
        call setline(10, "")
        call setline(11, "int main(int argc, char *argv[])")
        call setline(12, "{")
        call setline(13, '    cout << "Hello ,world!" << endl;')
        call setline(14, "    return 0;")
        call setline(15, "}")
    elseif &filetype == 'java'
        call SetHeader()
        call setline(8, "public class ".expand("%:r")." {")
        call setline(9,  "    public static void main(String[] args) {")
        call setline(10, '         System.out.println("Hello World");')
        call setline(11, "    }")
        call setline(12, "}")
    endif
endfunc
""""""""""""""""""""""""""""""""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

