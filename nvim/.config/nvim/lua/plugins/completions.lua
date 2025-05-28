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
    buffer        = "[Buffer]",
    nvim_lsp      = "[LSP]",
    luasnip       = "[LuaSnip]",
    nvim_lua      = "[Lua]",
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
                    maxwidth = {
                        menu = 50, -- leading text (labelDetails)
                        abbr = 50, -- actual suggestion item
                    },
                    ellipsis_char = "...",
                    show_labelDetails = true,
                    before = before_functions["long"],
                }),
            },
        })
    end,
}
