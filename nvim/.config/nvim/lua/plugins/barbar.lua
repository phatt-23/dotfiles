return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons },
    },
    config = function()
        vim.g.barbar_auto_setup = false

        require("bufferline").setup({
            animation = true,
            clickable = true,
            tabpages = true,
            no_name_title = '[No Name]',
            buffer_index = true,
            icons = {
                filetype = {
                    custom_colors = false,
                    enabled = true,
                },
                separator = {left = '▎', right = ''},
                separator_at_end = true,
            },
        })

        vim.cmd([[
            " Move to previous/next
            nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
            nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

            " Re-order to previous/next
            nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
            nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>

            " Goto buffer in position...
            nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
            nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
            nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
            nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
            nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
            nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
            nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
            nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
            nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
            nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

            " Pin/unpin buffer
            nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

            " Close buffer
            nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>

            " Restore buffer
            nnoremap <silent>    <A-s-c> <Cmd>BufferRestore<CR>
        ]])

        vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
        vim.cmd [[hi TabLineFill guibg=NONE ctermbg=NONE]]
        vim.cmd [[hi BufferTabpageFill guibg=NONE ctermbg=NONE]]
        vim.cmd [[hi BufferCurrent guibg=NONE ctermbg=NONE]]
        vim.cmd [[hi BufferInactive guibg=NONE ctermbg=NONE]]

        vim.api.nvim_set_hl(0, 'BufferCurrentSign', { bg = 'NONE', bold = true })
        vim.api.nvim_set_hl(0, 'BufferVisibleSign', { bg = 'NONE', bold = true })
        vim.api.nvim_set_hl(0, 'BufferInactiveSign', { bg = 'NONE', bold = true })
        vim.api.nvim_set_hl(0, 'BufferTabpageFill', { bg = 'NONE' })
    end,
}
