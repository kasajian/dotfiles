set nocompatible

syntax enable
filetype plugin indent on

if has("gui_running")
  set lines=35 columns=96
else
  set background=dark
endif

set path+=**

set encoding=utf-8
set scrolloff=3
set autoindent
set autowriteall
set showmode
set showcmd
set nohidden
set wildignore+=*/node_modules/*,*/__pycache__/,*/bin/*
set wildmenu
" set wildmode=list:longest
set visualbell
" set cursorline
" set cursorcolumn
" set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set number
set undofile
" set undolevels
" set undoreload

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

set wrap
" set textwidth=79
set formatoptions=qrn1
" set colorcolumn=85

let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


" set undodir=~/.vim/.undo//
" set backupdir=~/.vim/.backup//
" set directory=~/.vim/.swp//


set clipboard=unnamed
set clipboard^=unnamed,unnamedplus
set mouse=a 
