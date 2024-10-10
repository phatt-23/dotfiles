return {
    "nvimtools/none-ls.nvim",
    config = function()
        require("null-ls").setup({
            -- sources = {
                -- null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.formatting.csharpier,
                -- null_ls.builtins.formatting.prettier,
                -- null_ls.builtins.formatting.black,
                -- null_ls.builtins.formatting.clang_format,
            -- },
        })

        vim.keymap.set("n", "<leader>oo", vim.lsp.buf.format, {})
    end,
}
