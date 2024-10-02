require("config.lazy") -- lazy config

vim.cmd([["numberline
    set number
    set relativenumber
    set signcolumn=yes:2 "the margin between the numberline and the border
    set numberwidth=6 "number width, the gap between numberline and current numberline
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
    set mouse=a "allow mouse
    set termguicolors
    set scrolloff=10
]])

vim.cmd([["search
    set hlsearch
    set incsearch
    set ignorecase
    set path+=** "search recursively down the filesystem
]])

vim.cmd([["idk
    set ttyfast
    set wildmenu
    set foldmethod=manual
    set timeout
    set timeoutlen=300
    "set clipboard=unnamedplus
    "set notimeout
]])

vim.cmd([["custom keybinds
    "on lines that wrap around, movement is visual
    nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
    nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

    "copy to system clipboard
    vnoremap <C-c> "+y

    "move lines or blocks up and down
    nnoremap <A-j> :m .+1<CR>
    nnoremap <A-k> :m .-2<CR>
    inoremap <A-j> <Esc>:m .+1<CR>gi
    inoremap <A-k> <Esc>:m .-2<CR>gi
    vnoremap <A-j> :m '>+1<CR>gvgv
    vnoremap <A-k> :m '<-2<CR>gvgv
]])

-- overrides the default background highlight
-- of matching words in some themes to be underlined
vim.cmd([[
    hi IlluminatedWordText  guibg=NONE gui=underline
    hi IlluminatedWordRead  guibg=NONE gui=underline
    hi IlluminatedWordWrite guibg=NONE gui=underline
]])

