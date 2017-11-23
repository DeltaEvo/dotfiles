set shortmess+=c

imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<tab>": "")



let g:cm_sources_override = {
	\ 'cm-css': {'enable':0}
	\ }
