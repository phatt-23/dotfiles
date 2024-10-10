return {
    -- install with yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.cmd([[
                  function OpenMarkdownPreview (url)
                        execute "silent ! firefox --new-window " . a:url
                  endfunction
                  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
            ]])
        end,
        ft = { "markdown" },
        
    },
}
