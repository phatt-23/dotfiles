vim.cmd([["numberline
    set number
    " set relativenumber
    set signcolumn=no
    " set numberwidth=6 
]])

vim.cmd([["tabbing and indenting
    set expandtab
    set autoindent
    set tabstop=4
    set shiftwidth=4
    set smarttab
    set softtabstop=4
]])

vim.cmd([["wrapping settings
    set textwidth=0
    set wrap
    set wrapmargin=0
    set linebreak "break by words instead of characters
]])

vim.cmd([["terminal
    set encoding=UTF-8
    set mouse=a 
    set termguicolors
    set scrolloff=4
]])

vim.cmd([["search
    set hlsearch
    set incsearch
    set ignorecase
    set path+=** 
]])

vim.cmd([["idk
    set ttyfast
    set wildmenu
    set foldmethod=manual
    set timeout
    set timeoutlen=300
    set undofile
    set updatetime=100

    set guicursor+=n:block
    set guicursor+=i:ver25
    set guicursor+=v:block
]])

