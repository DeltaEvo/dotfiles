if &compatible
	set nocompatible
endif

source ~/.vim/vim-plug/plug.vim

call plug#begin('~/.vim/bundles')
	source ~/.vim/plugins.vim
call plug#end()

" AutoInstall plugins
autocmd VimEnter *
	\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\|   PlugInstall --sync | q
	\| endif

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
set pastetoggle=<leader>z
set inccommand=split
set fillchars+=vert:│

map <Space> <Leader>

" Mappings
nnoremap <Return> za
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Show help in a vertical tab instead of an horizontal one
cnoremap help vert bo help
