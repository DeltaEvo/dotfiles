set hidden

let g:LanguageClient_serverCommands = {
	\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	\ 'javascript': ['~/.vim/langservers/javascript-typescript-stdio'],
	\ 'vue': ['~/.vim/langservers/vls'],
	\ 'html': ['~/.vim/langservers/html-languageserver', '--stdio'],
	\ 'json': ['~/.vim/langservers/json-languageserver', '--stdio'],
	\ 'css': ['~/.vim/langservers/css-languageserver', '--stdio'],
	\ 'scss': ['~/.vim/langservers/css-languageserver', '--stdio']
	\ }
