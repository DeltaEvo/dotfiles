#!/usr/bin/env bash
PWD=$(pwd)

function install_from_npm {
	local name=$1
	local bin=$2
	npm --loglevel=error install $name
	rm -f $PWD/$bin
	ln -s $PWD/node_modules/.bin/$bin $PWD/$bin
}

install_from_npm vscode-json-languageserver-bin json-languageserver
install_from_npm vscode-css-languageserver-bin css-languageserver
install_from_npm vscode-html-languageserver-bin html-languageserver
install_from_npm vue-language-server vls 
install_from_npm typescript tsserver
install_from_npm typescript-language-server typescript-language-server
