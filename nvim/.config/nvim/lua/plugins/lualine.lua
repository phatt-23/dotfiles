return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
       require("lualine").setup({
            options = {
                globalstatus = true,
                icons_enabled = true,
                -- section_separators = { left = "", right = "" },
                component_separators = "|",
                -- component_separators = { left = "│", right = "│" },
                -- section_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
                -- component_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(mode)
                            return mode
                        end,
                        color = { gui = "bold" },
                    },
                },
                lualine_b = {
                    {
                        "branch",
                        icon = "󰊢 ",
                        color = { gui = "bold" },
                    },
                    {
                        "diff",
                        symbols = { added = "+", modified = "~", removed = "-" },
                    },
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                    },
                },
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                        color = { gui = 'bold' }
                    }
                },
                lualine_x = {
                    {
                        'filetype',
                    },
                },
                lualine_y = {
                    {
                        'progress',
                    },
                },
                lualine_z = {
                    {
                        'location',
                        fmt = function(loc)
                            return loc
                        end,
                        color = { gui = 'bold' },
                    }
                },
            },
        })
    end,
}
