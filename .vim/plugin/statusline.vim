set statusline=
set statusline +=%2*\ %n\ %*            "buffer number
set statusline +=%1*\ %{&ff}\ %*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor


function! Custom_statusline_hi()
	hi User1 ctermbg=220 ctermfg=237
	hi User2 ctermbg=237
	hi User3 guifg=#ff66ff guibg=#222222
	hi User4 guifg=#a0ee40 guibg=#222222
	hi User5 guifg=#eeee40 guibg=#222222
endfunction


call Custom_statusline_hi()

augroup STATUSLINE
    autocmd!
    autocmd ColorScheme * call Custom_statusline_hi()
augroup END
