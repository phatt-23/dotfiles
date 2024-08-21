vim.cmd("set encoding=UTF-8")
vim.cmd("set expandtab")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set hlsearch")
vim.cmd("set autoindent")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set smarttab")
vim.cmd("set softtabstop=4")
vim.cmd("set mouse=a")
vim.cmd("set mouse=v")
vim.cmd("set signcolumn=yes")
vim.cmd("set ttyfast")
vim.cmd("set ignorecase")
vim.cmd("set incsearch")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set path+=**")
vim.cmd("set wildmenu")

vim.opt.termguicolors = true
vim.opt.scrolloff = 10

require("config.lazy")

vim.cmd.colorscheme("gruvbox")
