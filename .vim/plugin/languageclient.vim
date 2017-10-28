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
	let schemas = json_decode(system("cat ~/.vim/langservers/schemas.json"))
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
