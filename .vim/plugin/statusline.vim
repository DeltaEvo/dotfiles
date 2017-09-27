let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set statusline=
set statusline +=%2*\ %n\ %*            "buffer number
set statusline +=%3*\ %*               "separator
set statusline +=%1*%{&ff}%*        "file format
set statusline +=%4*\ %*               "separator
set statusline +=%2*\ %y\ %*            "file type
set statusline +=%3*\ %*               "separator

set statusline +=%1*%<%F%*          "full path
set statusline +=%1*%m%*                "modified flag
set statusline +=%4*\ %*               "separator
set statusline +=%2*%=%*                "rigth separator
set statusline +=%2*%{gutentags#statusline('[Generating...]')}\ %* "gutentags
set statusline +=%3*\ %*               "separator
set statusline +=%1*%l/%L%*             "lines
set statusline +=%4*\ %*               "separator
set statusline +=%2*\ %v\ %*             "virtual column number
set statusline +=%3*\ %*               "separator
set statusline +=%1*%{toupper(g:currentmode[mode()])}%*
set statusline +=%4*\ %*               "separator

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
