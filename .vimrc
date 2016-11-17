set nocompatible              " be iMproved, required
filetype off                  " required

" Add pathogen to path
set rtp+=~/.vim/bundle/vim-pathogen
execute pathogen#infect()

filetype plugin indent on
syntax on
colorscheme monokai
autocmd vimenter * NERDTree
" YouCompleteMe params
let rust_root = systemlist('rustc --print sysroot')[0]
let g:ycm_rust_src_path = rust_root . '/lib/rustlib/src/rust/src'
