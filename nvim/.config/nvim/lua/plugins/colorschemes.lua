return {
    {
        -- basic themes
        "blazkowolf/gruber-darker.nvim",
        priority = 1000,
        dependencies = {
            "sho-87/kanagawa-paper.nvim",
            "ellisonleao/gruvbox.nvim",
            "zenbones-theme/zenbones.nvim",
            "rktjmp/lush.nvim",
            "slugbyte/lackluster.nvim",
            "cideM/yui",
            "TaurusOlson/darkburn.vim",
            "phha/zenburn.nvim",
            "folke/tokyonight.nvim",
            "aliqyan-21/darkvoid.nvim",
            "shaunsingh/nord.nvim",
            "bluz71/vim-moonfly-colors",
            "nyoom-engineering/oxocarbon.nvim",
            "gantoreno/nvim-gabriel",
            "rose-pine/neovim",
            "metalelf0/base16-black-metal-scheme",
        },
        lazy = false,
        opts = {},
        config = function()
            -- vim.cmd.colorscheme("moonfly")
            -- vim.cmd.colorscheme("nord")
            -- vim.cmd.colorscheme("darkvoid")
            -- vim.cmd.colorscheme("gruber-darker")
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
            vim.cmd.colorscheme("base16-black-metal-mayhem")
        end,
    },
    {
        -- https://github.com/SeniorMars/dotfiles
        "ellisonleao/gruvbox.nvim", -- theme
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                contrast = "hard",
                palette_overrides = { dark0_hard = "#0E1018" },
                overrides = {
                    NormalFloat = { fg = "#ebdbb2", bg = "#504945" },
                    Comment = { fg = "#81878f", italic = true, bold = true },
                    Define = { link = "GruvboxPurple" },
                    Macro = { link = "GruvboxPurple" },
                    ["@constant.builtin"] = { link = "GruvboxPurple" },
                    ["@storageclass.lifetime"] = { link = "GruvboxAqua" },
                    ["@text.note"] = { link = "TODO" },
                    ["@namespace.rust"] = { link = "Include" },
                    ["@punctuation.bracket"] = { link = "GruvboxOrange" },
                    texMathDelimZoneLI = { link = "GruvboxOrange" },
                    texMathDelimZoneLD = { link = "GruvboxOrange" },
                    luaParenError = { link = "luaParen" },
                    luaError = { link = "NONE" },
                    ContextVt = { fg = "#878788" },
                    CopilotSuggestion = { fg = "#878787" },
                    CocCodeLens = { fg = "#878787" },
                    CocWarningFloat = { fg = "#dfaf87" },
                    CocInlayHint = { fg = "#ABB0B6" },
                    CocPumShortcut = { fg = "#fe8019" },
                    CocPumDetail = { fg = "#fe8019" },
                    DiagnosticVirtualTextWarn = { fg = "#dfaf87" },
                    -- fold
                    Folded = { fg = "#fe8019", bg = "#0E1018", italic = true },
                    SignColumn = { bg = "#0E1018" },
                    -- new git colors
                    DiffAdd = {
                        bold = true,
                        reverse = false,
                        fg = "",
                        bg = "#2a4333"
                    },
                    DiffChange = {
                        bold = true,
                        reverse = false,
                        fg = "",
                        bg = "#333841"
                    },
                    DiffDelete = {
                        bold = true,
                        reverse = false,
                        fg = "#442d30",
                        bg = "#442d30"
                    },
                    DiffText = {
                        bold = true,
                        reverse = false,
                        fg = "",
                        bg = "#213352"
                    },
                    -- statusline
                    StatusLine = { bg = "#ffffff", fg = "#0E1018" },
                    StatusLineNC = { bg = "#3c3836", fg = "#0E1018" },
                    CursorLineNr = { fg = "#fabd2f", bg = "" },
                    GruvboxOrangeSign = { fg = "#dfaf87", bg = "" },
                    GruvboxAquaSign = { fg = "#8EC07C", bg = "" },
                    GruvboxGreenSign = { fg = "#b8bb26", bg = "" },
                    GruvboxRedSign = { fg = "#fb4934", bg = "" },
                    GruvboxBlueSign = { fg = "#83a598", bg = "" },
                    WilderMenu = { fg = "#ebdbb2", bg = "" },
                    WilderAccent = { fg = "#f4468f", bg = "" },
                    -- coc semantic token
                    CocSemStruct = { link = "GruvboxYellow" },
                    CocSemKeyword = { fg = "", bg = "#0E1018" },
                    CocSemEnumMember = { fg = "", bg = "#0E1018" },
                    CocSemTypeParameter = { fg = "", bg = "#0E1018" },
                    CocSemComment = { fg = "", bg = "#0E1018" },
                    CocSemMacro = { fg = "", bg = "#0E1018" },
                    CocSemVariable = { fg = "", bg = "#0E1018" },
                    CocSemFunction = { fg = "", bg = "#0E1018" },
                    -- neorg
                    ["@neorg.markup.inline_macro"] = { link = "GruvboxGreen" }
                }
            })
            -- vim.cmd.colorscheme("gruvbox")
        end
    },
    {
		"catppuccin/nvim",
		name = "catppuccin",
        priority = 2000,
		opts = {
			term_colors = true,
			transparent_background = true,
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
			},
			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
			integrations = {
				telescope = {
					enabled = true,
				},
				dropbar = {
					enabled = true,
					color_mode = true,
				},
			},
		},
    }
}
