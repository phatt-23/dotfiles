return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("which-key").add({
                mode = { "n", "v" },
                { "<leader>f",  group = "telescope" },
                { "<leader>ff", "<CMD>lua require'telescope.builtin'.find_files()<CR>", desc = "files", },
                { "<leader>fg", "<CMD>lua require'telescope.builtin'.live_grep()<CR>",  desc = "grep" },
                { "<leader>fb", "<CMD>lua require'telescope.builtin'.buffers()<CR>",    desc = "buffers" },
                { "<leader>fh", "<CMD>lua require'telescope.builtin'.help_tags()<CR>",  desc = "help" },
                { "<leader>fx", "<CMD>lua require'telescope.builtin'.resume()<CR>",     desc = "Resume" },
            })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown()
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
}
