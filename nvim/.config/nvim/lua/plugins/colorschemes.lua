return {
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     vim.cmd [[colorscheme gruber-darker]]
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
