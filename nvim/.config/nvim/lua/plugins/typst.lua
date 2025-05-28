return {
    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
        version = '1.12.*',
        build = function()
            require('typst-preview').update()
        end,
    },
    {
        'kaarmu/typst.vim',
        ft = 'typst',
        lazy = false,
    },
}
