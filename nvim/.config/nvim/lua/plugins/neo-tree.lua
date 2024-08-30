return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",        -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        vim.keymap.set("n", "<leader>ee", ":Neotree filesystem left<CR>")
        vim.keymap.set("n", "<leader>ec", ":Neotree float<CR>")
        vim.keymap.set("n", "<leader>eb", ":Neotree buffers reveal float<CR>", {})
        require("neo-tree").setup({
            filesystem = {
                iltered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                window = {
                    mappings = {
                        ["<leader>p"] = "image_wezterm", -- " or another map
                        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
                        ["l"] = "focus_preview",
                        ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
                        ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
                    },
                },
                commands = {
                    image_wezterm = function(state)
                        local node = state.tree:get_node()
                        if node.type == "file" then
                            require("image_preview").PreviewImage(node.path)
                        end
                    end,
                },
            },
        })
    end,
}
