return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("which-key").add({
                mode = { "n", "v" },
                { "<leader>f",  group = "telescope" },
                { "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>", desc = "files", },
                { "<leader>fg", "<cmd>lua require'telescope.builtin'.live_grep()<cr>",  desc = "grep" },
                { "<leader>fb", "<cmd>lua require'telescope.builtin'.buffers()<cr>",    desc = "buffers" },
                { "<leader>fh", "<cmd>lua require'telescope.builtin'.help_tags()<cr>",  desc = "help" },
            })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            -- This is your opts table
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end
    },
}
