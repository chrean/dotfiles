set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" Editor
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'

" Syntax
Plugin 'puppetlabs/puppet-syntax-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set mouse=a
set mousehide
scriptencoding utf-8

" Colors
syntax enable
colorscheme Tomorrow-Night-Eighties

" Line numbers
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Formatting
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nowrap
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab

set viewoptions=folds,options,cursor,unix,slash
set spell
set hidden
set showmatch
set incsearch
set hlsearch
set ignorecase
set backspace=2

" No swap files
set noswapfile

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Shortcuts
let mapleader = ','

" NERDTree Config
let NERDTreeMouseMode=2
nnoremap <Leader>e :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
nnoremap <Leader>E :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>

" vim-airline
set laststatus=2
let g:airline_left_sep='›'
let g:airline_right_sep='‹'

" Auto resize splits
autocmd VimResized * wincmd =

" Scroll with up/down arrow keys
map <Up> <c-u>
map <Down> <c-d>

" Switch splits with left/right arrow keys
map <Right> <c-w>l
map <Left> <c-w>h
