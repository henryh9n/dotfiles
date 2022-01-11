set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

set number
set showmatch

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

set ruler

set mouse=a

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeShowHidden=1

syntax on

set clipboard=unnamed

map <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

set statusline+=%F

set colorcolumn=80

colorscheme gruvbox
set bg=dark

