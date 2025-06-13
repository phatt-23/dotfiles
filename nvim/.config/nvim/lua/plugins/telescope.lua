return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope.builtin")
            local mode = { "n", "v" }

            vim.keymap.set(mode, "<leader>ff", telescope.find_files,    { desc = "files", })
            vim.keymap.set(mode, "<leader>fg", telescope.live_grep,     { desc = "grep" })
            vim.keymap.set(mode, "<leader>fb", telescope.buffers,       { desc = "buffers" })
            vim.keymap.set(mode, "<leader>fh", telescope.help_tags,     { desc = "help" })
            vim.keymap.set(mode, "<leader>fx", telescope.resume,        { desc = "resume" })
            vim.keymap.set(mode, "<leader>fd", telescope.diagnostics,   { desc = "diagnostics"})
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            local telescope = require("telescope")

            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown()
                    }
                }
            })

            telescope.load_extension("ui-select")
        end
    },
}
