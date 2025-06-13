return {
    "3rd/image.nvim",
    build = false,
    opts = {},
    config = function()
        require("image").setup({
            backend = "ueberzug",
            processor = "magick_cli", -- or "magick_rock"
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = true,
                    only_render_image_at_cursor = false,
                    only_render_image_at_cursor_mode = "popup",
                    -- if true, images will be rendered in floating markdown windows
                    floating_windows = false,
                    -- markdown extensions (ie. quarto) can go here
                    filetypes = {
                        "markdown",
                        "vimwiki"
                    },
                },
                neorg = {
                    enabled = true,
                    filetypes = { "norg" },
                },
                typst = {
                    enabled = false,
                    filetypes = { "typst" },
                },
                html = {
                    enabled = false,
                },
                css = {
                    enabled = false,
                },
            },
            max_width = nil,
            max_height = nil,
            max_width_window_percentage = nil,
            max_height_window_percentage = 50,
            -- toggles images when windows are overlapped
            window_overlap_clear_enabled = false,
            window_overlap_clear_ft_ignore = {
                "cmp_menu",
                "cmp_docs",
                "snacks_notif",
                "scrollview",
                "scrollview_sign"
            },
            -- auto show/hide images when the editor gains/looses focus
            editor_only_render_when_focused = false,
            -- auto show/hide images in the correct Tmux window (needs visual-activity off)
            tmux_show_only_in_active_window = false,
            -- render image files as images when opened
            hijack_file_patterns = {
                "*.png",
                "*.jpg",
                "*.jpeg",
                "*.gif",
                "*.webp",
                "*.avif"
            },
        })
    end,
}
