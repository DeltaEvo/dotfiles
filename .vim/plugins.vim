call dein#add('tomasr/molokai')
call dein#add('Shougo/deoplete.nvim') 
call dein#add('Shougo/denite.nvim')
call dein#add('mhinz/vim-startify')
call dein#add('scrooloose/nerdtree' , { 'on_cmd': 'NERDTreeToggle' })
call dein#add('Xuyuanp/nerdtree-git-plugin', { 'on_cmd': 'NERDTreeToggle' })
call dein#add('ryanoasis/vim-devicons')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('neomake/neomake')
call dein#add('ctrlpvim/ctrlp.vim')

call dein#add('autozimu/LanguageClient-neovim' , { 'on_ft': ['rust'] })
call dein#add('critiqjo/lldb.nvim', { 'on_ft': ['rust'] })

" Rust
let rust = { 'on_ft': 'rust' }
call dein#add('rust-lang/rust.vim', rust)
call dein#add('racer-rust/vim-racer', rust)

" Javascript
let javascript = { 'on_ft': 'javascript' }
call dein#add('carlitux/deoplete-ternjs', javascript)
