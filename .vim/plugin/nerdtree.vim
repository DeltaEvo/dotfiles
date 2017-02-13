" Use Ctrl+T for NERDTree
map <silent> <C-t> :NERDTreeToggle<CR>
" Close NERDTree when it's the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
