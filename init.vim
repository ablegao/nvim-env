call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'Shougo/unite.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Plug 'sbdchd/neoformat',{'for':'python'}
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'tell-k/vim-autopep8'
Plug 'janko/vim-test'

" Plug 'jupyter-vim/jupyter-vim'
" Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" Plug 'delijati/vim-importmagic'

Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim' "文件搜索,杀手级,重新定义了编辑器打开文件的方式 
Plug 'vim-scripts/TaskList.vim'           "快速跳转到TODO列表
"Plug 'Shougo/echodoc.vim'

"color"
Plug 'rafi/awesome-vim-colorschemes'
Plug 'taigacute/gruvbox9'

Plug 'ap/vim-buftabline'
call plug#end()
filetype plugin on

"去掉vi的一致性"
set nocompatible
"显示行号"
set number
" 隐藏滚动条"    
set guioptions-=r 
set guioptions-=L
set guioptions-=b
"隐藏顶部标签栏"
set showtabline=0
"设置字体"
set guifont=Monaco:h13         
syntax on   "开启语法高亮"
set nowrap  "设置不折行"
set fileformat=unix "设置以unix的格式保存文件"
set cindent     "设置C样式的缩进格式"
set tabstop=4   "设置table长度"
set shiftwidth=4        "同上"
set expandtab  "tab用空格代替"
set showmatch   "显示匹配的括号"
set scrolloff=5     "距离顶部和底部5行"
set laststatus=2    "命令行为两行"
set fenc=utf-8      "文件编码"
set backspace=2
set mouse=a     "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase      "忽略大小写"
set incsearch
set hlsearch        "高亮搜索项"
set noexpandtab     "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread
set cursorline      "突出显示当前行"
set cursorcolumn        "突出显示当前列"



let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1 
let g:deoplete#auto_completion_start_length = 0

let g:deoplete#sources#go#gocode_binary="$GOPATH/bin/gocode"	
let g:deoplete#sources#go#package_dot = 1
"let g:deoplete#sources#go#cgo = 1
let g:deoplete#sources#go#builtin_objects=1    " 自动编译
let g:deoplete#sources#go#unimported_packages=1 " 尝试饮用为定义包名
let g:deoplete#sources#go#fallback_to_source=1 " 尝试找其他包名


let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }



let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
"let g:go_term_mode = "split"
let g:go_snippet_engine = "neosnippet"
let g:go_test_timeout= '10s'
let g:go_test_show_name = 1
autocmd FileType go nmap <leader>ta <Plug>(go-test)
autocmd FileType go nmap <leader>t <Plug>(go-test-func)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap K <Plug>(go-doc)

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '*'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'



"" python 
let g:jedi#completions_enabled = 0
"let g:jedi#use_splits_not_buffers = "right"
let g:autopep8_on_save = 1
let g:jedi#goto_command = "gd"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#documentation_command = "K"
let g:autopep8_disable_show_diff=1
let test#strategy = "neovim"
let test#enabled_runners=["python#pytest","python#django"]
autocmd FileType python nmap <leader>t :TestNearest <CR>
autocmd FileType python nmap <leader>ta :TestFile <CR>
autocmd FileType python set equalprg=autopep8\ -

let g:deoplete#sources#jedi#show_docstring=1
function HeaderPython()
	call setline(1, "#!/usr/bin/env python")
	call append(1, "# -*- coding: utf-8 -*-")
	call append(2, "# Able Gao @" . strftime('%Y-%m-%d %T', localtime()))
	call append(3, "# ablegao@gmail.com")
	normal G
	normal o
	normal o
endf
autocmd bufnewfile *.py call HeaderPython()



"" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeMapOpenInTab='<2-LeftMouse>'




function! TreeTagbarToggle()
NERDTreeToggle
TagbarToggle
endfunction

let mapleader=" "
nmap <silent> <F8> :call TreeTagbarToggle() <CR>
nmap <silent> <F7> : TaskList <CR>
nmap <silent> <F9> : MBEToggle <CR>

if has("termguicolors")
    " fix bug for vim
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum

    " enable true color
    set termguicolors
endif

"set notermguicolors
let g:airline_theme='gruvbox'
"set background=light
colorscheme gruvbox
