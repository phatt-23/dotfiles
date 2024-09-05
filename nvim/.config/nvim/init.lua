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
    set path+=**
    set wildmenu
    "set clipboard=unnamedplus
]])

-- vim.cmd("set notimeout")
-- vim.cmd("set timeoutlen=500")

vim.o.timeout = true
vim.o.timeoutlen = 300

vim.opt.termguicolors = true
vim.opt.scrolloff = 10

require("config.lazy")
require("keybinds")

-- colorscheme
vim.cmd([[
    "let g:gruvbox_italic=1
    "let g:gruvbox_colors='dark0_hard'
    "colorscheme gruvbox

    colorscheme gruber-darker
]])


vim.cmd([[
    hi IlluminatedWordText gui=underline
    hi IlluminatedWordRead gui=underline
    hi IlluminatedWordWrite gui=underline
]])

-- vim.opt_local.commentstring = "-- %s"
-- vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
