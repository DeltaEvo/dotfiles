if &compatible
	set nocompatible
endif

set runtimepath+=~/.vim/dein.vim

let plugin_path = expand('~/.vim/bundles')
if dein#load_state(plugin_path)
	call dein#begin(plugin_path)

	source ~/.vim/plugins.vim

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax on
colorscheme molokai
set t_Co=256
set relativenumber 
set number
set noexpandtab
set preserveindent
set shiftwidth=2
set tabstop=2
