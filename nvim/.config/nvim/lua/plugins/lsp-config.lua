local lsp_names = {
    "lua_ls",
    "rust_analyzer",
    "csharp_ls",
    "eslint",
    "tsserver",
    "html",
    "cssls",
    "clangd",
    "sqlls",
}

return {
    lsp_names = lsp_names,
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
                lspconfig[lsp_name].setup({
                    handlers = handlers,
                })
            end

            vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

            -- Got it from here: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
            -- Specify how the border looks like
            local border = {
                { "┌", "FloatBorder" },
                { "─", "FloatBorder" },
                { "┐", "FloatBorder" },
                { "│", "FloatBorder" },
                { "┘", "FloatBorder" },
                { "─", "FloatBorder" },
                { "└", "FloatBorder" },
                { "│", "FloatBorder" },
            }

            -- To instead override globally
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end


        end,
    },
}
