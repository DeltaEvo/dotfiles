if &compatible
	set nocompatible
endif

source ~/.vim/vim-plug/plug.vim

call plug#begin('~/.vim/bundles')
	source ~/.vim/plugins.vim
call plug#end()

syntax on
set termguicolors
colorscheme space-vim-dark

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

set t_Co=256
set relativenumber 
set number
set autoindent
set tabstop=2
set shiftwidth=2
set list lcs=tab:\|\ 
set cursorcolumn
set cursorline
