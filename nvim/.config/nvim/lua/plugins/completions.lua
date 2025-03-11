local cmp_kinds = {
    Text          = '  ',
    Method        = '  ',
    Function      = '  ',
    Constructor   = '  ',
    Field         = '  ',
    Variable      = '  ',
    Class         = '  ',
    Interface     = '  ',
    Module        = '  ',
    Property      = '  ',
    Unit          = '  ',
    Value         = '  ',
    Enum          = '  ',
    Keyword       = '  ',
    Snippet       = '󰅴  ',
    Color         = '  ',
    File          = '  ',
    Reference     = '  ',
    Folder        = '  ',
    EnumMember    = '  ',
    Constant      = '  ',
    Struct        = '  ',
    Event         = '  ',
    Operator      = '  ',
    TypeParameter = '  ',
}

local menu_sources = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    luasnip = "[LuaSnip]",
    nvim_lua = "[Lua]",
    latex_symbols = "[LaTeX]",
}

local before_functions = {
    ["long"] = function(entry, vim_item)
        vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind .. " "
        vim_item.menu = menu_sources[entry.source.name]
        return vim_item
    end,
    ["long_custom"] = function(entry, vim_item)
        local rpad = function(str, length, padding)
            local result = str .. string.rep(padding or ' ', length - #str)
            return result, result ~= str
        end

        local menu = menu_sources[entry.source.name]

        local length_of_longest_kind = string.len("TypeParameter")
        local provider = rpad("(" .. (string.lower(vim_item.kind) or "") .. ")", length_of_longest_kind, " ")

        vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. " "
        vim_item.menu = provider .. " " .. menu

        return vim_item
    end,
    ["short"] = function(entry, vim_item)
        vim_item.kind = (cmp_kinds[vim_item.kind] or "")
        vim_item.menu = menu_sources[entry.source.name]
        return vim_item
    end,
}


return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp"
        },
    },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("plugins.completion.kinds").setup()

        local cmp = require("cmp")
        local lspkind = require("lspkind")


        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
                { name = "luasnip" },
                { name = "latex_symbols" }
            },
            formatting = {
                fields = {
                    cmp.ItemField.Kind, -- symbol and text
                    cmp.ItemField.Abbr, -- what it is
                    cmp.ItemField.Menu, -- provider
                },
                format = lspkind.cmp_format({
                    -- mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                    -- preset = "default",   -- or 'codicons' for codicon preset (requires vscode-codicons font), default: 'default'
                    -- menu = ({
                    --     buffer = "[Buffer]",
                    --     nvim_lsp = "[LSP]",
                    --     luasnip = "[LuaSnip]",
                    --     nvim_lua = "[Lua]",
                    --     latex_symbols = "[Latex]",
                    -- }),
                    maxwidth = {
                        menu = 50, -- leading text (labelDetails)
                        abbr = 50, -- actual suggestion item
                    },
                    -- can also be a function to dynamically calculate max width such as
                    -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                    ellipsis_char = "...",    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = before_functions["long"],
                }),
            },
        })

        local color = require('onedark.colors')

        -- Colors
        vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = color.bg0, bg = "NONE", strikethrough = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = color.blue, bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = color.blue, bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = color.purple, bg = "NONE", italic = true })
    end,
}
