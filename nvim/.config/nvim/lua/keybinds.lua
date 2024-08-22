-- https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
vim.cmd("nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')")
vim.cmd("nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')")
