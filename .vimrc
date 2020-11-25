" Auto-install vii<ilfefariiPu><Plug>_s_dger<<Plug__><Plug_>Plug>rree__dd<<Plug>Plug>aaeell<< exist. For
" Wi<iloe1ai><Plu<P_der<Plug>_lug>_der<Plug>_g>ael<th curl installed are supported (after Windows 10
" build 17063, source:
" https://devblogs.microsoft.com/commandline/tar-and-curl-come-to-windows/).
" The following script to install vim-plug is adapted from vim-plug
" wiki: https://github.com/junegunn/vim-plug/wiki/tips#tips

"let g:VIM_PLUG_PATH = expand(g:nvim_config_root . '/autoload/plug.vim')
"if executable('curl')
    "if empty(glob(g:VIM_PLUG_PATH))
        "echomsg 'Installing Vim-plug on your system'
        "silent execute '!curl -fLo ' . g:VIM_PLUG_PATH . ' --create-dirs '
            "\ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
        "augroup plug_init
            "autocmd!
            "autocmd VimEnter * PlugInstall --sync | quit |source $MYVIMRC
        "augroup END
    "endif
"else
    "echoerr 'You have to install curl to install vim-plug, or install '
            "\ . 'vim-plug by yourself.'
    "finish
"endif

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set scrolloff=10
" A sensible vimrc for Go development
"
" Please note that the following settings are some default that I used
" for years. However it might be not the case for you (and your
" environment). I highly encourage to change/adapt the vimrc to your own
" needs. Think of a vimrc as a garden that needs to be maintained and fostered
" throughout years. Keep it clean and useful - Fatih Arslan


" imap <j><j> :<esc>    " for insert mode
set background=light "  set background=light


"""""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
"set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
if !has('nvim')
set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set ttyscroll=3                 " Speedup scrolling
endif
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
"set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set foldenable                  " allow 折叠
set foldmethod=indent           " 折叠方式
set pastetoggle=<F2>            " 进入粘贴模式
set expandtab                   " tab替换为空格 noexpandtab 替换为字符
set tabstop=4                   " tab == 4
set shiftwidth=4                " 宽度为4 要一起配置

set paste


" 设置空白字符的视觉提示
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽
""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

inoremap jk <ESC>
nnoremap <leader>d :n<CR>
nnoremap <leader>u :N<CR>

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>


" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" move bettwen in windows 
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"将当前行当做命令执行。在试验东西时通常比q:更方便。
nnoremap <leader>e :exe getline(line('.'))<cr>

" 使用leader+w 直接保存
inoremap <leader>w <Esc>:w<cr>
nnoremap <leader>w :w<cr>

" sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif
		
" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

"""""""""""""""""""""
" Plugins Manager   "
"""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
" 不启用插件
" Plug 'foo/bar', { 'on': [] }

Plug 'scrooloose/nerdtree'
" colorschme
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'tomasr/molokai'
Plug 'rakr/vim-one'

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

 " AI 代码补全工具tabnine
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh'  } 

Plug 'numirias/semshi', {'do' : ':UpdateRemotePlugins'}
" 语法检查和自动化make
Plug 'neomake/neomake'
" 自动补全
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" python source
Plug 'zchee/deoplete-jedi'
" 括号匹配
Plug 'jiangmiao/auto-pairs'
" 注释插件
Plug 'scrooloose/nerdcommenter'
" 注释单行，使用 <leader>cc，其中 leader 是在 Nvim 中设置的前导按键（Nvim 中默认为 /）；如果要反注释，使用 <leader>cu。更多具体使用方法可以参考插件的文档。
" https://github.com/scrooloose/nerdcommenter#default-mappings
" 
" 多点编辑
Plug 'terryma/vim-multiple-cursors'
"命令模式下，首先把光标移动到要重命名的变量处，然后开始按 Ctrl + N，可以看到变量被高亮，继续按 Ctrl + N，变量下一个出现的地方被高亮显示，如果要跳过某个位置该变量的出现（例如，字符串中也可能包含与该变量名相同的子字符串），在该处被高亮以后，再按 Ctrl + X 取消高亮即可，不断选中变量的出现位置，直到所有想要选中的位置均选中完毕。
"此时，按下 c（c 在 Nvim 中代表 change ）,进入编辑模式，输入变量新的名称，保存即可。更多使用方法，请参考该插件的文档。
"

" 高亮显示复制区域
Plug 'machakann/vim-highlightedyank'

" 代码折叠
Plug 'tmhedberg/SimpylFold'
"zo： 打开光标处的 fold
"zO： 递归打开光标处所有 fold
"zc： 关闭光标处 fold
"zC： 关闭光标处所有 fold

" lastplace
Plug 'farmergreg/vim-lastplace'

" file history
Plug 'mhinz/vim-startify'

""{{ Plugins for markdown writing
" Distraction free writing
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" Only light on your cursor line to help you focus
Plug 'junegunn/limelight.vim', {'for': 'markdown'}

" Markdown syntax highlighting
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }

" Another markdown plugin
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Faster footnote generation
Plug 'vim-pandoc/vim-markdownfootnotes', { 'for': 'markdown' }

" Vim tabular plugin for manipulate tabular, required by markdown plugins
Plug 'godlygeek/tabular', {'on': 'Tabularize'}

" Markdown JSON header highlight plugin
Plug 'elzr/vim-json', { 'for': ['json', 'markdown'] }

" Markdown previewing
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


" emoji
" Plug 'https://gitlab.com/gi1242/vim-emoji-ab'
Plug 'fszymanski/deoplete-emoji', {'for': 'markdown'}
"}}

"
"" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"" go 补全提示
Plug 'Blackrush/vim-gocode'
call plug#end()


"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""
colorscheme one
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

let g:airline_theme='molokai'
" colorscheme gruvbox

" {deoplete
let g:deoplete#enable_at_startup = 1
" You can use ctrl+n and ctrl+p (which are conveniently close to everything else). Incidentally, these also work in bash and other useful places, so are good to get used to.


" 避免方法提升不关闭 参考https://goo.gl/Bn5n39
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" Preview 窗口的可以设为在当前窗口下面打开吗？
" 默认 preview 窗口在上面打开，可以通过 set splitbelow 使新建立的窗口位于当前窗口下面，参见。https://github.com/Shougo/deoplete.nvim/issues/416
" tab 在自动补全的列表跳转 
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
 inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#manual_complete()
                function! s:check_back_space() abort "{{{
                let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~ '\s'
                endfunction"}}}
"}

" nerdcommenter
" Allow commenting and inverting empty lines (useful when commenting a region)
" 4,cc 多行注释
" 允许注释空行
let g:NERDCommentEmptyLines = 1


" nerdtree
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
" C-w-w 两个w在nerdtree 和file中切换
" the ignore patterns are regular expression strings and seprated by comma
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
"
"augroup nerdtree_open
    "autocmd!
    "autocmd VimEnter * NERDTree | wincmd p
"augroup END
"


" vim-startify 
" deny startify auto change directory
let g:startify_change_to_dir = 0

" MarkdownPreview
"nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
"imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
"nmap <silent> <F9> <Plug>MarkdownPreviewStop    " for normal mode
"imap <silent> <F9> <Plug>MarkdownPreviewStop    " for insert mode
nmap <silent> <F10> <Plug>MarkdownPreviewToggle " for normal mode
imap <silent> <F10> <Plug>MarkdownPreviewToggle " for insert mode
" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'google-chrome'



"neomake
" 命令模式下，使用 :Neomake 命令检查代码正确性。或者也可以设置自动检查 https://github.com/neomake/neomake#setup
call neomake#configure#automake('nrwi',500)
"
" vim-highlightedyank
" 避免某些主题高亮颜色看不清
"hi HighlightedyankRegion cterm=reverse gui=reverse
" 调整时间
"let g:highlightedyank_highlight_duration = 1000 " 高亮持续时间为 1000 毫秒

map <leader>q :call CompileRunGcc()<CR>
" 一键执行
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!python %'
    elseif &filetype == 'go'
        exec '!go run %'
 "   elseif &filetype == 'sh'
 "       :!time bash %
    endif                                                                       
endfunc<Paste>

" vim-gocode
imap <F6> <C-x><C-o>
" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>


augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
