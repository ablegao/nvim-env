call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/neossh.vim'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'zivyangll/git-blame.vim'

Plug 'autozimu/LanguageClient-neovim', {
     \ 'branch': 'next',
     \ 'do': 'bash install.sh',
     \ }
Plug 'junegunn/fzf'
" Plug 'Shougo/neoinclude.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mileszs/ack.vim'


if has('win32') || has('win64')
  Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
else
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
endif

" Plug 'zchee/deoplete-clang'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

 Plug 'sbdchd/neoformat',{'for':'python'}
Plug 'deoplete-plugins/deoplete-jedi'
 Plug 'davidhalter/jedi-vim'
 Plug 'Chiel92/vim-autoformat'
"" Plug 'fisadev/vim-isort'
Plug 'janko/vim-test'
 Plug 'tpope/vim-dispatch'
" Plug 'jupyter-vim/jupyter-vim'
" Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" Plug 'delijati/vim-importmagic'

"Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim' "文件搜索,杀手级,重新定义了编辑器打开文件的方式 
Plug 'vim-scripts/TaskList.vim'           "快速跳转到TODO列表
"Plug 'Shougo/echodoc.vim'

""" markdown 


"  c/c++
Plug 'skywind3000/asyncrun.vim'


"color"
Plug 'rafi/awesome-vim-colorschemes'
Plug 'taigacute/gruvbox9'
Plug 'altercation/vim-colors-solarized'
Plug 'liuchengxu/space-vim-theme'

Plug '0x3024/vim'
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
"set guifont=Monaco:h13         
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
set mouse=a " nicr "a     "启用鼠标"
set selection=exclusive
"set selectmode=mouse,key
set matchtime=5
set ignorecase      "忽略大小写"
set incsearch
set hlsearch        "高亮搜索项"
set noexpandtab     "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread
set cursorline      "突出显示当前行"
set cursorcolumn        "突出显示当前列"
set hidden
set clipboard=unnamed "共享剪贴板
set grepprg=ack\ --nogroup\ $*
let g:vimfiler_as_default_explorer = 1

" c/c++
"

" " 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" 用户输入至少两个字符时再开始提示补全
call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

" 字符串中不补全
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['String']
            \ )


autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" 是的vim script和zsh script都有，这就是deoplete
call deoplete#custom#option('sources', {
            \ 'cpp': ['LanguageClient'],
            \ 'c': ['LanguageClient'],
            \ 'lua': ['LanguageClient'],
            \ 'python': ['LanguageClient'],
            \ 'md': ['efm-language','-c','~/.config/nvim/efm-config.yaml'],
            \ 'yaml': ['efm-language','-c','~/.config/nvim/efm-config.yaml'],
            \ 'zsh': ['zsh']
            \})

" Clang
let g:deoplete#sources#clang#libclang_path="/usr/local/opt/llvm/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header="/usr/local/opt/llvm/lib/clang/8.0.1"
let g:LanguageClient_rootMarkers = {
            \ 'cpp': ['compile_commands.json', 'build'],
            \ 'c': ['compile_commands.json', 'build']
            \ }
" 为语言指定Language server和server的参数
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['clangd', '-compile-commands-dir='.getcwd()."/build/"],
            \ 'c': ['clangd', '-compile-commands-dir='.getcwd().'/build/'],
            \ 'lua': ['lua-lsp'],
			\ "python":['pyls','-vv','--log-file','/tmp/pyls.log']
            \ }

"let g:LanguageClient_serverCommands={"python":['pyls', '-vv', '--log-file', '/tmp/pyls.log']}
let g:LanguageClient_settingsPath="~/.config/nvim/lc-settings.json"
set completefunc=LanguageClient#complete
" set formatexpr=LanguageClient_textDocument_rangeFormatting()
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
let  g:LanguageClient_diagnosticsSignsMax=2

" markdown 
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:instant_markdown_autostart = 1
let g:instant_markdown_slow = 1
let g:markdownfmt_autosave=1

"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1 
let g:deoplete#auto_completion_start_length = 0

let g:deoplete#sources#go#gocode_binary="$GOPATH/bin/gocode"	
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#source_importer = 1
let g:deoplete#sources#go#pointer=1
let g:deoplete#sources#go#auto_goos=1

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
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:test#go#gotest#file_pattern="\v.*_test\.go$"
autocmd FileType go nmap <leader>ta <Plug>(go-test)
autocmd FileType go nmap <leader>t <Plug>(go-test-func)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap K <Plug>(go-doc)

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '*'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'



let test#neovim#term_position = "topleft"

"" python 
let g:jedi#completions_enabled = 0
"let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_command = "gd"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#documentation_command = "K"

" let g:autopep8_on_save = 1
" let g:autopep8_disable_show_diff=1

"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:autoformat_remove_trailing_spaces = 0
""autocmd FileType python let g:autoformat_autoindent=1
"autocmd FileType python let g:autoformat_retab=1
"autocmd FileType python let g:autoformat_remove_trailing_spaces=1
"let g:formatter_yapf_style ="google"
"" let g:formatter_yapf_style = 'pep8'
"let g:formatters_python = ['yapf']


let test#strategy = "neovim"
let test#enabled_runners=["python#pytest"]
let test#python#pytest#executable = 'python -m pytest --capture=no'

" autocmd FileType python nmap <leader>t :TestNearest <CR>
" autocmd FileType python nmap <leader>ta :TestFile <CR>
" autocmd FileType python nmap <leader>tl :TestLast <CR>
autocmd FileType *.py nmap <leader>t :TestNearest <CR>
autocmd FileType *.py nmap <leader>ta :TestFile <CR>
autocmd FileType *.py nmap <leader>tl :TestLast <CR>

function OnSaveFormatPython()
Autoformat
"Isort 
endf
autocmd BufWrite *.py :call LanguageClient_textDocument_formatting()
" autocmd BufWritePre *.rs :call LanguageClient#textDocument_formatting_sync()

autocmd BufWrite *.cpp :call LanguageClient_textDocument_formatting()
autocmd BufWrite *.h :call LanguageClient_textDocument_formatting()

autocmd FileType vimfiler nmap <silent><buffer> <2-LeftMouse> <Plug>(vimfiler_smart_l)


" autocmd BufWrite *.sh :call LanguageClient_textDocument_formatting()
" autocmd BufWrite *.vim :call LanguageClient_textDocument_formatting()
" autocmd BufWrite *.md :call LanguageClient_textDocument_formatting()
let g:LanguageClient_windowLogMessageLevel='Error'
let g:LanguageClient_diagnosticsDisplay=    {
    \1: {
	\"name": "Error",
	\"texthl": "ALEError",
	\"signText": "✖",
	\"signTexthl": "ALEErrorSign",
	\},
     	\2: {
            \"name": "Warning",
			\"texthl": "ALEWarning",
			\"signText": "⚠",
			\"signTexthl": "ALEWarningSign",
			\},
			\3: {
			\"name": "Information",
			\"texthl": "ALEInfo",
			\"signText": "ℹ",
			\"signTexthl": "ALEInfoSign",
			\},
			\4: {
			\"name": "Hint",
			\"texthl": "ALEInfo",
			\"signText": "➤",
			\"signTexthl": "ALEInfoSign",
			\},
			\}



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
VimFilerExplorer
TagbarToggle
endfunction

let mapleader=" "
"nmap <silent> <F8> :call TreeTagbarToggle() <CR>
nmap <silent> <F8> :VimFilerExplorer <CR>
nmap <silent> <F7> :TaskList <CR>
nmap <silent> <F9> :TagbarToggle <CR>

function! NumberToggle()
	set nu!
endfunction

nmap <silent> <F6>:call NumberToggle() <CR>

" 查找
nmap <leader>f : Ack -i 

function! GitBlame()
	let line =line(".") "getline('.')
	if len(line) >0
	execute '!git blame -L '.line.',1 '.@%
	endif 
endfunction 

nnoremap <Leader>s :call GitBlame() <CR>
nmap <leader>w : bd <CR> 
nmap <leader>n : bnext <CR>
nmap <leader>p : bprev <CR>
if has("termguicolors")
    " fix bug for vim
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum

    " enable true color
    set termguicolors
endif
if has("unix")
set notermguicolors
endif
let g:airline_theme='gruvbox'
set background=light
" colorscheme solarized
let g:seoul256_background = 256
" colorscheme seoul256
" colorscheme gruvbox
colorscheme space_vim_theme

" 避免json 隐藏引号
"let g:vim_json_syntax_conceal =1 
"let g:indentLine_noConcealCursor="nc"
"let g:vim_json_syntax_concealcursor=""
