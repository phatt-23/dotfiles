-- overrides the default background highlight
-- of matching words in some themes to be underlined
vim.cmd([[
    "Different colors in visual mode
    hi Visual guifg=Black guibg=Gray gui=bold

    "Make the current highlighted search bold
    hi Search gui=bold
    hi CurSearch gui=bold

    set pumblend=15
    hi Pmenu blend=15 
    hi PmenuSel blend=15

    "the vertical slit line
    hi WinSeparator guifg=#4c566a
]])


