return {
    {
        -- 'thimc/gruber-darker.nvim',
        -- config = function()
        --     require('gruber-darker').setup({
        --         -- OPTIONAL
        --         transparent = true, -- removes the background
        --         -- underline = false, -- disables underline fonts
        --         -- bold = false, -- disables bold fonts
        --     })
        --     vim.cmd.colorscheme('gruber-darker')
        -- end,
    },
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd [[colorscheme gruber-darker]]
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            --     require("tokyonight").setup {
            --         transparent = true,
            --         styles = {
            --             sidebars = "transparent",
            --             floats = "transparent",
            --         }
            --     }
            --
            --     require('barbecue').setup {
            --         theme = 'tokyonight',
            --     }
            --
            --
            --     vim.cmd [[colorscheme tokyonight]]
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "hard", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
            vim.o.background = "light"
            vim.cmd.colorscheme "gruvbox"
        end
    }
}
