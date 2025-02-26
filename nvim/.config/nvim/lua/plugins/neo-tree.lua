return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker",
        "3rd/image.nvim",
    },
    config = function()
        require("which-key").add({
            mode = { "n", "v" },
            { "<leader>e",  group = "neo-tree" },
            { "<leader>et", "<cmd>Neotree current toggle<CR>",     desc = "current toggle" },
            { "<leader>el", "<cmd>Neotree left toggle<CR>",        desc = "left toggle" },
            { "<leader>er", "<cmd>Neotree right toggle<CR>",       desc = "right toggle" },
            { "<leader>ef", "<cmd>Neotree filesystem current<CR>", desc = "filesystem" },
            { "<leader>eb", "<cmd>Neotree buffers current<CR>",    desc = "buffers" },
            { "<leader>eg", "<cmd>Neotree git_status current<CR>", desc = "git status" },
        })

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
                        -- ["<leader>p"] = "image_wezterm", -- " or another map
                        ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
                        -- ["l"] = "focus_preview",
                        -- ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
                        -- ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
                    },
                },
                -- commands = {
                --     image_wezterm = function(state)
                --         local node = state.tree:get_node()
                --         if node.type == "file" then
                --             require("image_preview").PreviewImage(node.path)
                --         end
                --     end,
                -- },
            },
            default_component_configs = {
                container = {
                    enable_character_fade = true,
                },
                indent = {
                    -- indent_size = 4,
                    -- padding = 2, -- extra padding on left hand side
                    indent_size = 2,
                    padding = 0, -- extra padding on left hand side
                    with_markers = true,
                    indent_marker = "│", -- "│",
                    last_indent_marker = "└", -- "└",
                    highlight = "NeoTreeIndentMarker",
                    with_expanders = true,
                    expander_collapsed = "", -- "",
                    expander_expanded = "", -- "",
                    expander_highlight = "NeoTreeExpander",
                },
                icon = {
                    -- folder_closed = "", 
                    -- folder_open = "", 
                    -- folder_empty = "" 
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
                        added = "a", --"", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified = "m", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted = "d", -- this can only be used in the git_status source
                        renamed = "r", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "?", -- 
                        ignored = "i",
                        unstaged = "u",
                        staged = "s",
                        conflict = "c",
                    },
                },
            },
            event_handlers = {
                {
                    event = "neo_tree_buffer_enter",
                    handler = function(event)
                        vim.cmd([[
                            " setlocal relativenumber
                            setlocal number
                            " setlocal numberwidth=6
                        ]])
                    end,
                },
            },
        })
    end,
}
