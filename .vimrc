set nocompatible

filetype plugin indent on

if has("gui_running")
  set lines=35 columns=96
else
  set background=dark
endif

syntax enable

command W execute 'silent! write !sudo tee % >/dev/null' | edit!
cnoremap w!! w !sudo /usr/bin/tee >/dev/null "%"

set path+=**

set encoding=utf-8
set scrolloff=3
set autoindent
" set autowriteall   " too aggressive: auto-saves on buffer switch
set hidden          " keep undo history when switching buffers
set showmode
set showcmd
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
set nowrapscan
" set textwidth=79
set formatoptions=qrn1
" set colorcolumn=85

let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


let s:vim_dir = expand('~/.vim')

if !isdirectory(s:vim_dir)
    call mkdir(s:vim_dir, 'p')
endif

if !isdirectory(s:vim_dir . '/undo-dir')
    call mkdir(s:vim_dir . '/undo-dir', 'p')
endif
set undodir=~/.vim/undo-dir
set undofile

if !isdirectory(s:vim_dir . '/.backup')
    call mkdir(s:vim_dir . '/.backup', 'p')
endif
set backupdir=~/.vim/.backup//

if !isdirectory(s:vim_dir . '/.swp')
    call mkdir(s:vim_dir . '/.swp', 'p')
endif
set directory=~/.vim/.swp//


if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif
set mouse=a 
