local lsp_names = {
    -- General Programming Languages
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
    "jdtls",         -- Java
    "phpactor",      -- PHP

    -- Database Languages
    "sqlls", -- SQL
    -- "sqls",  -- SQL (written in Go)


    -- Web Development Languages
    "html",        -- HTML
    "eslint",      -- Javascript, Typescript
    "cssls",       -- CSS
    "tailwindcss", -- TailwindCSS
    "svelte",      -- Svelte
    "jinja_lsp",   -- Django


    -- Typesetting Languages
    "texlab",   -- LaTeX
    "ltex",     -- LTeX
    "tinymist", -- Typst


    -- Configuration Languauges
    "taplo",    -- TOML
    "neocmake", -- CMake
}

local dap_names = {
    "java-debug-adapter",
    "java-test"
}

return {
    {
        "mortepau/codicons.nvim",
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = lsp_names,
                automatic_installation = true,
                automatic_enable = false,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = vim.tbl_deep_extend(
                "force", {},
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities()
            )


            for _, server_name in ipairs(lsp_names) do
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        require("nvim-navic").attach(client, bufnr)
                    end,
                })
            end


            lspconfig["clangd"].setup({
                cmd = {
                    "clangd",
                    "--background-index",
                    "--all-scopes-completion",
                    "--completion-style=detailed",
                    "--header-insertion=never",
                    "--pch-storage=memory"
                },
                fallbackFlags = { "-std=c++23" },
                filetypes = { "c", "cpp", "cc", "objc", "objcpp" },
                root_dir = require('lspconfig.util').root_pattern("compile_commands.json", ".git"),
                single_file_support = true,
            })


            lspconfig["rust_analyzer"].setup({
                settings = {
                    ["rust-analyzer"] = {
                        diagnostics = {
                            enable = true,
                        }
                    }
                }
            })


            lspconfig["tinymist"].setup({
                capabilities = capabilities,
                settings = {
                    formatterMode = "typstyle",
                    exportPdf = "never"
                },
            })


            vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
                pattern = { "*.vert", "*.frag" },
                callback = function(_)
                    vim.cmd("set filetype=glsl")
                end
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(e)
                    local opts = { buffer = e.buf }

                    local telescope = require("telescope.builtin")
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts, { desc = "go to definition" })
                    vim.keymap.set("n", "gD", vim.lsp.buf.definition, opts, { desc = "go to declaration" })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts, { desc = "show documentation"})
                    vim.keymap.set("n", "<LEADER>oo", vim.lsp.buf.format, opts, { desc = "format the code" })
                    vim.keymap.set({"n", "v"}, "<LEADER>ca", vim.lsp.buf.code_action, opts, { desc = "show code actions" })
                    vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "show references"})
                    vim.keymap.set("n", "gi", telescope.lsp_implementations, { desc = "show implementation"})
                end
            })


            require("which-key").add({
                mode = { "n" },
                { "<leader>l",  group = "lsp" },
                { "<leader>lr", "<cmd>LspRestart<CR>", desc = "restart" },
                { "<leader>li", "<cmd>LspInfo<CR>",    desc = "info" },
                { "<leader>ls", "<cmd>LspStart<CR>",   desc = "start" },
                { "<leader>lx", "<cmd>LspStop<CR>",    desc = "stop" },
            })


            -- Got it from here:
            -- [https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization]
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

            -- instead of overriding borders globally
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = border or opts.border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end


            -- set_hl_for_floating_window = function()
            local function set_hl_for_floating_window()
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
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = dap_names,
            })
        end,
    }
}
