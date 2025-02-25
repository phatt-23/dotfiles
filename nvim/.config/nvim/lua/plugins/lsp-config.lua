local lsp_names = {
    "lua_ls",
    "rust_analyzer",
    -- "csharp_ls",
    "eslint",
    -- "tsserver",
    "html",
    "cssls",
    "clangd",
    "sqls",
    "sqlls",
    -- "ruby_lsp",
    -- "solargraph",
    -- "steep",
    -- "sorbet",
    -- "deno",
    "stimulus_ls",
    -- "rubocop",
    "taplo",
    "svelte",
    "pyright",
    -- "jedi_language_server",
    -- "ltex",
    "texlab",
    "templ",
    "gopls",
    -- "typst_lsp",
    "tinymist",
    -- "hls",
    "bashls",
    "asm_lsp",
    "denols",
    "neocmake",
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
        "onsails/lspkind.nvim", -- stuff that shows up in the completion window
        config = function()
            -- setup() is also available as an alias
            require("which-key").add({
                mode = { "n" },
                { "<leader>l",  group = "lsp" },
                { "<leader>lr", "<cmd>LspRestart<CR>", desc = "restart" },
                { "<leader>li", "<cmd>LspInfo<CR>",    desc = "info" },
                { "<leader>ls", "<cmd>LspStart<CR>",   desc = "start" },
                { "<leader>lx", "<cmd>LspStop<CR>",    desc = "stop" },
            })
            require("lspkind").init({
                -- defines how annotations are shown
                -- default: symbol
                -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                mode = "symbol_text",

                -- default symbol map
                -- can be either 'default' (requires nerd-fonts font) or
                -- 'codicons' for codicon preset (requires vscode-codicons font)
                --
                -- default: 'default'
                preset = "default",

                -- override preset symbols
                --
                -- default: {}
                -- symbol_map = {
                --     Text = "t",
                --     Method = "m",
                --     Function = "f",
                --     Constructor = "c",
                --     Field = "f",
                --     Variable = "v",
                --     Class = "C",
                --     Interface = "I",
                --     Module = "M",
                --     Property = "p",
                --     Unit = "u",
                --     Value = "val",
                --     Enum = "E",
                --     Keyword = "k",
                --     Snippet = "s",
                --     Color = "color",
                --     File = "file",
                --     Reference = "r",
                --     Folder = "dir",
                --     EnumMember = "Em",
                --     Constant = "const",
                --     Struct = "S",
                --     Event = "e",
                --     Operator = "o",
                --     TypeParameter = "",
                -- },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local navic = require("nvim-navic")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()


            require("lspconfig").clangd.setup {
                cmd = { "clangd", "--background-index", "--all-scopes-completion", "--completion-style=detailed", "--header-insertion=never", "--pch-storage=memory" },
                filetypes = { "c", "cpp", "cc", "objc", "objcpp" },
                root_dir = require('lspconfig.util').root_pattern("compile_commands.json", ".git"),
                single_file_support = true,
            }


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
                    init_options = init_opts,
                    on_attach = function(client, bufnr)
                        navic.attach(client, bufnr)
                    end,
                    capabilities = capabilities,
                })
            end

            require'lspconfig'.rust_analyzer.setup{
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            enable = true;
                        }
                    }
                }
            }


            -- deprecated
            -- require('lspconfig').typst_lsp.setup({
            --     settings = {
            --         exportPdf = "onType", -- Choose onType, onSave or never.
            --         serverPath = "",      -- Normally, there is no need to uncomment it.
            --     },
            --     on_attach = function(client, bufnr)
            --         navic.attach(client, bufnr)
            --     end,
            --     capabilities = capabilities,
            -- })

            vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
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
        end,
    },
    {
        'mrcjkb/haskell-tools.nvim',
        version = '^4', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },
}
