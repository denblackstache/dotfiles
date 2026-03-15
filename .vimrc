syntax on

set shell="$HOMEBREW_PREFIX/bin/zsh"

let mapleader = " "
let maplocalleader = "\\"

" Line numbers
set number
set relativenumber

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <Esc> :nohlsearch<cr>

" Controls
inoremap jj <Esc>
nnoremap U <C-r>
