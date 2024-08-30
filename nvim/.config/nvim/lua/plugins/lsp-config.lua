local lsp_names = {
    "lua_ls",
    "rust_analyzer",
    "csharp_ls",
    "eslint",
    "tsserver",
    "html",
    "cssls",
    "clangd",
}

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({ ensure_installed = lsp_names })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            for _, lsp_name in ipairs(lsp_names) do
                lspconfig[lsp_name].setup({})
            end

            vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
