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
