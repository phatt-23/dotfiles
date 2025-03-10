return {
    {
        -- basic themes
        "blazkowolf/gruber-darker.nvim",
        priority = 500,
        dependencies = {
            -- "sho-87/kanagawa-paper.nvim",
            "ellisonleao/gruvbox.nvim",
            "zenbones-theme/zenbones.nvim",
            "rktjmp/lush.nvim",
            "slugbyte/lackluster.nvim",
            "cideM/yui",
            "TaurusOlson/darkburn.vim",
            "phha/zenburn.nvim",
            "folke/tokyonight.nvim",
            "aliqyan-21/darkvoid.nvim",
            -- "shaunsingh/nord.nvim",
            "bluz71/vim-moonfly-colors",
            "nyoom-engineering/oxocarbon.nvim",
            "gantoreno/nvim-gabriel",
            "rose-pine/neovim",
            "metalelf0/base16-black-metal-scheme",
            "arcticicestudio/nord-vim", -- this nord is better than the other one
            "GustavoPrietoP/doom-themes.nvim",
            "Mofiqul/vscode.nvim",
            "caglartoklu/borlandp.vim",
            "jamescherti/vim-tomorrow-night-deepblue",
            "ramojus/mellifluous.nvim",
            "google/vim-colorscheme-primary",
            "RRethy/base16-nvim",
            "loctvl842/monokai-pro.nvim",
            "tanvirtin/monokai.nvim",
            "polirritmico/monokai-nightasty.nvim",
        },
        lazy = false,
        opts = {},
        config = function()
            -- vim.cmd.colorscheme("moonfly")
            -- vim.cmd.colorscheme("nord")
            -- vim.cmd.colorscheme("darkvoid")
            -- vim.cmd.colorscheme("gruber-darker")
            -- vim.cmd.colorscheme("gruvbox")
            -- vim.cmd.colorscheme("lackluster-mint")
            -- vim.cmd.colorscheme("lackluster-night")
            -- vim.cmd.colorscheme("lackluster-hack")
            -- vim.cmd.colorscheme("lackluster-dark")
            -- vim.cmd.colorscheme("zenbones")
            -- vim.cmd.colorscheme("yui") -- paper light theme
            -- vim.cmd.colorscheme("yui_dark") -- shit
            -- vim.cmd.colorscheme("nordbones")
            -- vim.cmd.colorscheme("darkburn")
            -- vim.cmd.colorscheme("kanagawabones")
            -- vim.cmd([[
            --     colo zenburn
            --     hi LineNr      guibg=#3f3f3f guifg=#f0deae
            --     hi LineNrAbove guibg=#3f3f3f guifg=#5d6262
            --     hi LineNrBelow guibg=#3f3f3f guifg=#5d6262
            --     hi Cursor      cterm=bold
            -- ]])
            -- vim.cmd.colorscheme("tokyonight-night")
            -- vim.cmd.colorscheme("catppuccin-frappe")
            -- vim.cmd.colorscheme("rose-pine-moon")
            -- vim.cmd.colorscheme("base16-black-metal-mayhem")
            -- vim.cmd.colorscheme("nord")
            -- vim.cmd.colorscheme("doom-nord")
            -- vim.cmd.colorscheme("doom-gruvbox")
            -- vim.cmd.colorscheme("doom-monokai-flatland")
            -- vim.cmd.colorscheme("doom-oceanic-next")
            -- vim.cmd.colorscheme("vscode")
            -- vim.cmd.colorscheme("ukraine")
            -- vim.cmd.colorscheme("borlandp")
            -- vim.cmd.colorscheme("tomorrow-night-deepblue")
            -- vim.cmd.colorscheme("mellifluous")
            -- vim.cmd.colorscheme("primary") -- google
            -- vim.cmd.colorscheme("darkburn")
            -- vim.cmd.colorscheme("base16-3024");
            -- vim.cmd.colorscheme("base16-monokai");
            -- vim.cmd.colorscheme("base16-gigavolt");
            -- vim.cmd.colorscheme("base16-github");
            -- vim.cmd.colorscheme("base16-gruber")
            -- vim.cmd.colorscheme("base16-harmonic-dark")
            -- vim.cmd.colorscheme("monokai-pro-classic")
            -- vim.cmd.colorscheme("monokai-nightasty")
            vim.cmd.colorscheme("onedark")
        end,
    },
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function ()
            require('onedark').setup({
                -- Main options --
                style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
                transparent = true,  -- Show/hide background
                term_colors = true, -- Change terminal color as per the selected theme style
                ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
                cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

                -- toggle theme style ---
                toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
                toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

                -- Change code style ---
                -- Options are italic, bold, underline, none
                -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
                code_style = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none'
                },

                -- Lualine options --
                lualine = {
                    transparent = true, -- lualine center bar transparency
                },

                -- Custom Highlights --
                colors = {}, -- Override default colors
                highlights = {}, -- Override highlight groups

                -- Plugins Config --
                diagnostics = {
                    darker = true, -- darker colors for diagnostic
                    undercurl = true,   -- use undercurl instead of underline for diagnostics
                    background = true,    -- use background color for virtual text
                },
            })
        end
    },
    {
        -- https://github.com/SeniorMars/dotfiles
        "ellisonleao/gruvbox.nvim", -- theme
        priority = 1000,
        -- config = function()
        --     require("gruvbox").setup({
        --         contrast = "hard",
        --         palette_overrides = { dark0_hard = "#0E1018" },
        --         overrides = {
        --             NormalFloat = { fg = "#ebdbb2", bg = "#504945" },
        --             Comment = { fg = "#81878f", italic = true, bold = true },
        --             Define = { link = "GruvboxPurple" },
        --             Macro = { link = "GruvboxPurple" },
        --             ["@constant.builtin"] = { link = "GruvboxPurple" },
        --             ["@storageclass.lifetime"] = { link = "GruvboxAqua" },
        --             ["@text.note"] = { link = "TODO" },
        --             ["@namespace.rust"] = { link = "Include" },
        --             ["@punctuation.bracket"] = { link = "GruvboxOrange" },
        --             texMathDelimZoneLI = { link = "GruvboxOrange" },
        --             texMathDelimZoneLD = { link = "GruvboxOrange" },
        --             luaParenError = { link = "luaParen" },
        --             luaError = { link = "NONE" },
        --             ContextVt = { fg = "#878788" },
        --             CopilotSuggestion = { fg = "#878787" },
        --             CocCodeLens = { fg = "#878787" },
        --             CocWarningFloat = { fg = "#dfaf87" },
        --             CocInlayHint = { fg = "#ABB0B6" },
        --             CocPumShortcut = { fg = "#fe8019" },
        --             CocPumDetail = { fg = "#fe8019" },
        --             DiagnosticVirtualTextWarn = { fg = "#dfaf87" },
        --             -- fold
        --             Folded = { fg = "#fe8019", bg = "#0E1018", italic = true },
        --             SignColumn = { bg = "#0E1018" },
        --             -- new git colors
        --             DiffAdd = {
        --                 bold = true,
        --                 reverse = false,
        --                 fg = "",
        --                 bg = "#2a4333"
        --             },
        --             DiffChange = {
        --                 bold = true,
        --                 reverse = false,
        --                 fg = "",
        --                 bg = "#333841"
        --             },
        --             DiffDelete = {
        --                 bold = true,
        --                 reverse = false,
        --                 fg = "#442d30",
        --                 bg = "#442d30"
        --             },
        --             DiffText = {
        --                 bold = true,
        --                 reverse = false,
        --                 fg = "",
        --                 bg = "#213352"
        --             },
        --             -- statusline
        --             StatusLine = { bg = "#ffffff", fg = "#0E1018" },
        --             StatusLineNC = { bg = "#3c3836", fg = "#0E1018" },
        --             CursorLineNr = { fg = "#fabd2f", bg = "" },
        --             GruvboxOrangeSign = { fg = "#dfaf87", bg = "" },
        --             GruvboxAquaSign = { fg = "#8EC07C", bg = "" },
        --             GruvboxGreenSign = { fg = "#b8bb26", bg = "" },
        --             GruvboxRedSign = { fg = "#fb4934", bg = "" },
        --             GruvboxBlueSign = { fg = "#83a598", bg = "" },
        --             WilderMenu = { fg = "#ebdbb2", bg = "" },
        --             WilderAccent = { fg = "#f4468f", bg = "" },
        --             -- coc semantic token
        --             CocSemStruct = { link = "GruvboxYellow" },
        --             CocSemKeyword = { fg = "", bg = "#0E1018" },
        --             CocSemEnumMember = { fg = "", bg = "#0E1018" },
        --             CocSemTypeParameter = { fg = "", bg = "#0E1018" },
        --             CocSemComment = { fg = "", bg = "#0E1018" },
        --             CocSemMacro = { fg = "", bg = "#0E1018" },
        --             CocSemVariable = { fg = "", bg = "#0E1018" },
        --             CocSemFunction = { fg = "", bg = "#0E1018" },
        --             -- neorg
        --             ["@neorg.markup.inline_macro"] = { link = "GruvboxGreen" }
        --         }
        --     })
        --     -- vim.cmd.colorscheme("gruvbox")
        -- end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 2000,
        opts = {
            -- term_colors = true,
            -- transparent_background = true,
            -- styles = {
            --     comments = {},
            --     conditionals = {},
            --     loops = {},
            --     functions = {},
            --     keywords = {},
            --     strings = {},
            --     variables = {},
            --     numbers = {},
            --     booleans = {},
            --     properties = {},
            --     types = {},
            -- },
            -- color_overrides = {
            --     mocha = {
            --         base = "#000000",
            --         mantle = "#000000",
            --         crust = "#000000",
            --     },
            -- },
            -- integrations = {
            --     telescope = {
            --         enabled = true,
            --     },
            --     dropbar = {
            --         enabled = true,
            --         color_mode = true,
            --     },
            -- },
        },
    }
}


