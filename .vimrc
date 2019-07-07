
" Normal settion
""""""""""""""""""""""""""""""""""""""""""""""""""
" vim system completion
set cot=noselect,menu,preview

" paste mode
set paste

" color
set t_Co=256

" set the tab shift
set tabstop=4
set shiftwidth=4 
set softtabstop=4
set expandtab

" auto indent
set autoindent

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Highlight current column
set cursorcolumn
" Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" set list
" Highlight searches
" set hlsearch
" Ignore case of searches
set ignorecase
" smart case
" set smartcase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set notitle
" Show the (partial) command as it’s being typed
set showcmd

""""""""""""""""""""""""""""""""""""""""""""""""""

" NERD Tree Setting
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
" show hidden files
let NERDTreeShowHidden=1
""""""""""""""""""""""""""""""""""""""""""""""""""


" Vundle Setting
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" let Vundle manage vimux
Plugin 'benmills/vimux'

" let Vundle manage nerdtree
Plugin 'scrooloose/nerdtree'

Plugin 'easymotion/vim-easymotion'

" install fzf for vim, the fzf is installed by homebrew and this path is created by it too
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

" install lightline
Plugin 'itchyny/lightline.vim'

Plugin 'joshdick/onedark.vim'

Plugin 'sheerun/vim-polyglot'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

" a chinese doc for vim
Plugin 'yianwillis/vimcdoc'

" cheat sheet
Plugin 'lifepillar/vim-cheat40'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'keith/swift.vim'

" ---------- ios dev ----------

Plugin 'xavierd/clang_complete'
Plugin 'eraserhd/vim-ios'
Plugin 'msanders/cocoa.vim'

" ----------------------------

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
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
""""""""""""""""""""""""""""""""""""""""""""""""""


" config plugin
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""

" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" set theme
colorscheme onedark

" set lightline theme
let g:lightline = { 'colorscheme': 'one' }

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>


" Automatic commands
""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
	" make vimdiff wrap automatically
	autocmd FilterWritePre * if &diff | setlocal wrap< | endif
	" Automatically source vimrc on save.
	autocmd! bufwritepost $MYVIMRC source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""


" key mapping
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""fzf part""""""""""
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-k> <plug>(fzf-complete-word)

""""""""""copy""""""""""
noremap <leader>y "+y
noremap <leader>p "+p

""""""""""""""""""""""""""""""""""""""""""""""""""