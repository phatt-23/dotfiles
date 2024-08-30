vim.cmd([[
    set encoding=UTF-8
    set expandtab
    set number
    set relativenumber
    set hlsearch
    set autoindent
    set tabstop=4
    set shiftwidth=4
    set smarttab
    set softtabstop=4
    set mouse=a
    set signcolumn=yes
    set ttyfast
    set ignorecase
    set incsearch
    set clipboard=unnamedplus
    set path+=**
    set wildmenu
]])

-- vim.cmd("set notimeout")
-- vim.cmd("set timeoutlen=500")

vim.o.timeout = true
vim.o.timeoutlen = 300

vim.opt.termguicolors = true
vim.opt.scrolloff = 10

require("config.lazy")
require("keybinds")

vim.cmd.colorscheme("gruber-darker")
vim.cmd([[
    hi IlluminatedWordText gui=underline
    hi IlluminatedWordRead gui=underline
    hi IlluminatedWordWrite gui=underline
]])

-- vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])


