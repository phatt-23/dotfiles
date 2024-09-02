local lsp_names = {
    "lua_ls",
    "rust_analyzer",
    "csharp_ls",
    "eslint",
    "tsserver",
    "html",
    "cssls",
    "clangd",
    "sqls",
    "sqlls",
    "ruby_lsp",
    -- "solargraph",
    -- "steep",
    "stimulus_ls",
    -- "sorbet",
    "rubocop",
    -- "deno",
    "taplo",
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
        "onsails/lspkind.nvim",
        config = function()
            -- setup() is also available as an alias
            require("lspkind").init({
                -- defines how annotations are shown
                -- default: symbol
                -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                mode = "text_symbol", -- dont know what it does

                -- default symbol map
                -- can be either 'default' (requires nerd-fonts font) or
                -- 'codicons' for codicon preset (requires vscode-codicons font)
                --
                -- default: 'default'
                preset = "default",

                -- override preset symbols
                --
                -- default: {}
                symbol_map = {
                    Text = "󰉿",
                    Method = "󰆧",
                    Function = "󰊕",
                    Constructor = "",
                    Field = "󰜢",
                    Variable = "󰀫",
                    Class = "󰠱",
                    Interface = "",
                    Module = "",
                    Property = "󰜢",
                    Unit = "󰑭",
                    Value = "󰎠",
                    Enum = "",
                    Keyword = "󰌋",
                    Snippet = "",
                    Color = "󰏘",
                    File = "󰈙",
                    Reference = "󰈇",
                    Folder = "󰉋",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "󰙅",
                    Event = "",
                    Operator = "󰆕",
                    TypeParameter = "",
                },
            })
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

            -- for mathing window color
            -- vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=black]])
            -- vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=fg guibg=bg]])

            local set_hl_for_floating_window = function()
                vim.api.nvim_set_hl(0, "NormalFloat", {
                    link = "Normal",
                })
                vim.api.nvim_set_hl(0, "FloatBorder", {
                    bg = "none",
                })
            end

            set_hl_for_floating_window()

            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                desc = "Avoid overwritten by loading color schemes later",
                callback = set_hl_for_floating_window,
            })

            lspconfig.ruby_lsp.setup({
                init_options = {
                    formatter = 'standard',
                    linters = { 'standard' },
                },
            })
        end,
    },
}
