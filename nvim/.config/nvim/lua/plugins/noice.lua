return {
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup({})
            vim.keymap.set("n", "<leader>rn", ":IncRename ", { desc = "Rename identifier." })
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            vim.keymap.set("n", "<Esc>", function()
                require("notify").dismiss()
            end, { desc = "Dismiss notify popup" })

            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = true,            -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true,        -- add a border to hover docs and signature help
                },
                views = {
                    split = {
                        enter = true,
                    },
                },
            })

            require("notify").setup({
                background_colour = "#ffffff",
                fps = 75,
                -- render = "wrapped-compact",
                render = "wrapped-compact",
                stages = "fade_in_slide_out",
                timeout = 1000,
                top_down = true,
                max_height = function()
                    return math.floor(vim.o.lines * 0.30)
                end,
                max_width = function()
                    return math.floor(vim.o.columns * 0.30)
                end,
                on_open = function(win)
                    vim.api.nvim_win_set_config(win, {
                        focusable = true,
                    })
                end,
            })
        end
    }
}
