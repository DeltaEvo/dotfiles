set nocompatible              " be iMproved, required
filetype off                  " required

" Add pathogen to path
set rtp+=~/.vim/bundle/vim-pathogen
execute pathogen#infect()

" Use system clipboard
set clipboard=unnamedplus

filetype plugin indent on
syntax on
colorscheme monokai

set number
" Set powerline font
let g:airline_powerline_fonts = 1
" Start NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

" YouCompleteMe params
let rust_root = systemlist('rustc --print sysroot')[0]
let g:ycm_rust_src_path = rust_root . '/lib/rustlib/src/rust/src'
