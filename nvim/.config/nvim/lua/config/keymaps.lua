vim.cmd([["Custom Keybinds
    "on lines that wrap around, movement is visual
    nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
    nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

    "copy and paste from system clipboard
    vnoremap <C-c> "+y
    nnoremap <C-c> "+yy

    nnoremap <C-S-v> "+P
    inoremap <C-S-v> <Esc>"+Pa
    vnoremap <C-S-v> "+P
    vnoremap <C-S-v> "+P

    "move lines or blocks up and down
    nnoremap <A-j> :m .+1<CR>
    nnoremap <A-k> :m .-2<CR>
    inoremap <A-j> <Esc>:m .+1<CR>gi
    inoremap <A-k> <Esc>:m .-2<CR>gi
    vnoremap <A-j> :m '>+1<CR>gvgv
    vnoremap <A-k> :m '<-2<CR>gvgv
    
    "open diagnostics in a floating window
    nnoremap <leader>dd :lua vim.diagnostic.open_float()<CR>
]])

