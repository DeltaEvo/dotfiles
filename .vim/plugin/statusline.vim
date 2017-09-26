set statusline=
set statusline +=%2*\ %n\ %*            "buffer number
set statusline +=%3*\ %*               "separator
set statusline +=%1*\ %{&ff}\ %*        "file format
set statusline +=%4*\ %*               "separator
set statusline +=%2*\ %y\ %*            "file type
set statusline +=%3*\ %*               "separator
set statusline +=%1*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor


function! Custom_statusline_hi()
	hi User1 ctermbg=220 ctermfg=236
	hi User2 ctermbg=237
	hi User3 ctermbg=220 ctermfg=237
	hi User4 ctermbg=237 ctermfg=220
endfunction


call Custom_statusline_hi()

augroup STATUSLINE
    autocmd!
    autocmd ColorScheme * call Custom_statusline_hi()
augroup END
