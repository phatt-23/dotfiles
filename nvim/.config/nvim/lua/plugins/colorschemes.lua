return {
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     vim.cmd [[colorscheme gruber-darker]]
        --
        --     -- Transparent background override
        --     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        --     vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        --     vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        --     vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
        --     vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
        --     vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
        --     vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
        --     vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        -- end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup {
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                }
            }

            require('barbecue').setup {
                theme = 'tokyonight',
            }


            vim.cmd [[colorscheme tokyonight]]
        end
    }
}
