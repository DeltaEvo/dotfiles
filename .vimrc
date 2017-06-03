if &compatible
	set nocompatible
endif

source ~/.vim/vim-plug/plug.vim

call plug#begin('~/.vim/bundles')
	source ~/.vim/plugins.vim
call plug#end()

syntax on
colorscheme space-vim-dark

set t_Co=256
set relativenumber 
set number
set noexpandtab
set autoindent
set shiftwidth=2
set tabstop=2
set list lcs=tab:\|\ 

