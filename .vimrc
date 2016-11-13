set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()

filetype plugin indent on
syntax on
colorscheme monokai
autocmd vimenter * NERDTree
" YouCompleteMe params
let g:ycm_rust_src_path = '/usr/src/rust/src'
