set hidden

let g:LanguageClient_serverCommands = {
	\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	\ 'javascript': ['~/.vim/langservers/typescript-language-server', '--stdio', '--tsserver-path', '~/.vim/langservers/tsserver'],
	\ 'typescript': ['~/.vim/langservers/typescript-language-server', '--stdio', '--tsserver-path', 'node_modules/.bin/tsserver'],
	\ 'vue': ['~/.vim/langservers/vls'],
	\ 'html': ['~/.vim/langservers/html-languageserver', '--stdio'],
	\ 'json': ['~/.vim/langservers/json-languageserver', '--stdio'],
	\ 'css': ['~/.vim/langservers/css-languageserver', '--stdio'],
	\ 'scss': ['~/.vim/langservers/css-languageserver', '--stdio']
	\ }

let g:LanguageClient_autoStart = 1

function! LoadSchemas()
	let schemas = json_decode(join(readfile($HOME . "/.vim/langservers/schemas.json"), "\n"))
	call LanguageClient_notify('json/schemaAssociations', schemas)
endfunction

augroup JSON_Schemas
	autocmd!
	autocmd User LanguageClientStarted if &ft == "json" | call LoadSchemas() | endif
augroup END

augroup LanguageClient_config
	autocmd!
	autocmd User LanguageClientStarted setlocal signcolumn=yes
	autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

augroup LanguageClient_signature
	autocmd!
	autocmd BufEnter * let b:Plugin_LanguageClient_started = 0
	autocmd User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
	autocmd User LanguageClientStopped let b:Plugin_LanguageClient_started = 0
	autocmd CursorMoved * if b:Plugin_LanguageClient_started | call LanguageClient_textDocument_signatureHelp() | endif
augroup END

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
