return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.api.nvim_create_autocmd(
            { "FIleType" },
            { pattern = "tex", command = "TSBufDisable highlight" }
        )
        vim.cmd([[
            filetype plugin indent on
            syntax enable
            let g:vimtex_view_method = 'zathura'
            let g:vimtex_view_general_viewer = 'okular'
            let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
            let g:vimtex_compiler_method = 'latexmk'
        ]])
    end,
}
