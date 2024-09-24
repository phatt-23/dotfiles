return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.csharpier,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
            },
        })

        vim.keymap.set("n", "<leader>oo", vim.lsp.buf.format, {})
    end,
}
