"set nocompatible
set nocp  "关闭vi的一致性模式，避免以前版本的一些Bug和局限


"开启语法高亮
syntax enable
syntax on 

filetype on " 检测文件类型
filetype plugin on "开启插件，加载vim自带和插件相应的语法和文件类型相关脚本
filetype indent on "针对不同的文件，采用不同的缩进方式

"设置主题
set background=dark
colorscheme molokai
"colorscheme solarized

"设置粘贴模式
set paste "原样复制

" 设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" 显示行号
set number
"相对行数
set relativenumber

" 高亮显示当前行/列
set cursorline
set cursorcolumn

"搜索高亮显示
set hlsearch

" 缩进与tab空格数
set autoindent "自动缩进
set smarttab "让vim把连续数量的空格视为一个制表符
set expandtab "将制表符扩展为空格
set tabstop=4 "设定 tab 长度为 4
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格

" 鼠标
set mouse=a "打开鼠标模式
"set nonu "不需要复制行号
"set selection=exclusive
"set selectmode=mouse,key

set ignorecase " 设置搜索时忽略大小写
set smartcase  " 当搜索的时候尝试smart 

"代码折叠
set foldenable  " 允许折叠
"标记折叠
set foldmarker=//{{{,//}}} """通过zc 折叠代码，zo展开
set fdm=marker
"缩进折叠
"set foldmethod=indent  "或者set fdm=indent, 根据代码缩进进行折叠

" Ignore file config
set wildignore+=*DS_Store*

set showcmd "在状态栏显示正在输入的命令
set showmode "左下角显示当前Vim模式
set ruler " 显示当前行号和列号
set showmatch " 设置代码匹配,包括括号匹配情况


"*********************************plugin*******************************************

"流行插件参考https://vimawesome.com/plugin
"插件管理工具有pathogen, vundle, neobundle, vimPlug等, 选择一种即可

"pathogen管理插件
" pathogen让每个插件占有一个单独的目录，解决了文件分散的问题,
" 参考https://github.com/tpope/vim-pathogen
"set rtp+=~/.vim/bundle/vim-pathogen
"source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim "二选一，两种方法，set或者source
"execute pathogen#infect()

"vundle 管理插件
" set the runtime path to include Vundle and initialize
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
"https://github.com/VundleVim/Vundle.vim
Plugin 'VundleVim/Vundle.vim' "通过制定github的用户名/项目名即可，https://github.com/VundleVim/Vundle.vim#about
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件

"https://github.com/scrooloose/nerdtree, 文件导航
Plugin 'scrooloose/nerdtree'

"https://vimawesome.com/plugin/syntastic， 提示各种语言语法错误
"Plugin 'scrooloose/syntastic'

"https://vimawesome.com/plugin/the-nerd-commenter， 快速加上注释和去掉注释
Plugin 'scrooloose/nerdcommenter'

"https://vimawesome.com/plugin/vim-go-sparks-fly
"Plugin 'fatih/vim-go'

"https://vimawesome.com/plugin/youcompleteme, 代码补全
"Plugin 'valloric/youcompleteme'

"https://vimawesome.com/plugin/vim-snippets
Plugin 'honza/vim-snippets'

"https://vimawesome.com/plugin/emmet-vim
Plugin 'mattn/emmet-vim'

"https://vimawesome.com/plugin/vim-colors-solarized-ours
Plugin 'altercation/vim-colors-solarized'

"https://vimawesome.com/plugin/fugitive-vim git 的包装
Plugin 'tpope/vim-fugitive'

"https://vimawesome.com/plugin/surround-vim
Plugin 'tpope/vim-surround'

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

"*********************************plugin config*******************************************

set maxmempattern=20000 "vim 提示 E363: uses more memory than 'maxmempattern'?
"设置状态行
set ch=1
set statusline=%F\ [%{&fenc}\ %{&ff}\ L%l/%L\ C%c]\ %=%{strftime('%Y-%m-%d\ %H:%M')}
set laststatus=2
