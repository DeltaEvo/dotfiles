" vim: fdm=marker

" UI {{{1
" Color scheme
Plug 'liuchengxu/space-vim-dark'
" Start menu
Plug 'mhinz/vim-startify'
" File icons
Plug 'ryanoasis/vim-devicons'
" Tag bar
Plug 'majutsushi/tagbar'

" Enhancements {{{1
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" File Manager
Plug 'tpope/vim-vinegar'
" Git wrapper
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" SudoWrite and other usefull commands
Plug 'tpope/vim-eunuch'
" Automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
Plug 'tpope/vim-sleuth'
" Better ga
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'easymotion/vim-easymotion'


" Completion {{{1
Plug 'roxma/nvim-completion-manager', { 'do': ':UpdateRemotePlugins' }
" LSP Protocol
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Debug {{{1
Plug 'critiqjo/lldb.nvim', { 'for': ['rust'] }

" Snippets {{{1
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Utils {{{1
" Load after/colors
Plug 'vim-scripts/AfterColors.vim'
" Manage tags file
Plug 'ludovicchabant/vim-gutentags'

" Tmux {{{1
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Syntaxes {{{1
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'rust-lang/rust.vim'
Plug 'LnL7/vim-nix'
Plug 'jparise/vim-graphql'


