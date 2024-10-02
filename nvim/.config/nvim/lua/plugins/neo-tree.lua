return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",        -- Optional image support in preview window: See `# Preview Mode` for more information
        "s1n7ax/nvim-window-picker",
    },
    config = function()
        vim.keymap.set("n", "<leader>et", ":Neotree current toggle<CR>")
        vim.keymap.set("n", "<leader>el", ":Neotree left toggle<CR>")
        vim.keymap.set("n", "<leader>er", ":Neotree right toggle<CR>")
        vim.keymap.set("n", "<leader>ef", ":Neotree filesystem current<CR>")
        vim.keymap.set("n", "<leader>eb", ":Neotree buffers current<CR>")
        vim.keymap.set("n", "<leader>eg", ":Neotree git_status current<CR>")

        require("neo-tree").setup({
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            filesystem = {
                filtered_items = {
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
            default_component_configs = {
                container = {
                    enable_character_fade = true,
                },
                indent = {
                    indent_size = 4,
                    padding = 2, -- extra padding on left hand side
                    with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "└",
                    highlight = "NeoTreeIndentMarker",
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                },
                modified = {
                    symbol = "[+]",
                    highlight = "NeoTreeModified",
                },
                name = {
                    trailing_slash = false,
                    use_git_status_colors = true,
                    highlight = "NeoTreeFileName",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added = "󰐕 ",    --"", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified = " ", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted = "󰆴 ",  -- this can only be used in the git_status source
                        renamed = "󰁔 ",  -- this can only be used in the git_status source
                        -- Status type
                        untracked = " ", -- 
                        ignored = " ",
                        unstaged = " ",
                        staged = " ",
                        conflict = " ",
                    },
                },
            },
        })
    end,
}
