local lsp_names = {
    -- Real Programming Languages
    "lua_ls",        -- Lua
    "clangd",        -- C, C++
    "csharp_ls",     -- C#
    "rust_analyzer", -- Rust
    "ruff",          -- Python
    "pyright",       -- Python 
    "bashls",        -- Bash
    "ts_ls",         -- Typescript
    "hls",           -- Haskell
    "asm_lsp",       -- Assembly
    "gopls",         -- Go (official)
    -- Database Languages
    "sqlls",         -- SQL
    "sqls",          -- SQL (written in Go)
    -- Web Development Languages
    "html",          -- HTML
    "eslint",        -- Javascript, Typescript
    "cssls",         -- CSS
    "svelte",        -- Svelte
    -- Typesetting Languages
    "texlab",        -- LaTeX
    "ltex",          -- LTeX
    "tinymist",      -- Typst
    -- Configuration Languauges
    "taplo",         -- TOML
    "neocmake",      -- CMake
}

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({ ensure_installed = lsp_names })
        end,
    },
    {
        "mortepau/codicons.nvim",
        config = function()
            local codicons = require('codicons')
            codicons.setup({})
        end,
    },
    {
        "onsails/lspkind.nvim", -- stuff that shows up in the completion window
        config = function()
            require("which-key").add({
                mode = { "n" },
                { "<leader>l",  group = "lsp" },
                { "<leader>lr", "<cmd>LspRestart<CR>", desc = "restart" },
                { "<leader>li", "<cmd>LspInfo<CR>",    desc = "info" },
                { "<leader>ls", "<cmd>LspStart<CR>",   desc = "start" },
                { "<leader>lx", "<cmd>LspStop<CR>",    desc = "stop" },
            })

            -- configured in completions.lua
            require("lspkind").init()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local navic = require("nvim-navic")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()


            local lspconfig_setup_init_options = {
                clangd = {
                    fallbackFlags = { "-std=c++23" },
                },
                ruby_lsp = {
                    formatter = "standard",
                    linters = { "standard" },
                },
            }

            -- setup every lsp with nvim completions
            -- and custom init_options
            for _, lsp_name in ipairs(lsp_names) do
                local init_opts = {}

                if lspconfig_setup_init_options[lsp_name] then
                    init_opts = lspconfig_setup_init_options[lsp_name]
                end

                lspconfig[lsp_name].setup({
                    on_attach = function(client, bufnr)
                        navic.attach(client, bufnr)
                    end,
                    init_options = init_opts,
                    capabilities = capabilities,
                })
            end


            lspconfig.ruff.setup({
                init_options = {
                    settings = {
                        -- Ruff language server settings go here
                    }
                }
            })


            lspconfig.clangd.setup({
                cmd = { "clangd", "--background-index", "--all-scopes-completion", "--completion-style=detailed", "--header-insertion=never", "--pch-storage=memory" },
                filetypes = { "c", "cpp", "cc", "objc", "objcpp" },
                root_dir = require('lspconfig.util').root_pattern("compile_commands.json", ".git"),
                single_file_support = true,
            })


            require('lspconfig').rust_analyzer.setup({
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            enable = true,
                        }
                    }
                }
            })

            vim.keymap.set({ "n" }, "<leader>oo", vim.lsp.buf.format, {})
            vim.keymap.set({ "n" }, "<leader>k", vim.lsp.buf.hover, {})
            vim.keymap.set({ "n" }, "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})


            -- Got it from here:
            --  [https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization]
            -- Specify how the border looks like
            local border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
            }

            -- To instead override globally
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = border or opts.border 
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
        end,
    },
    {
        'mrcjkb/haskell-tools.nvim',
        version = '^4', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },
}
