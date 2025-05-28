return {
    "3rd/image.nvim",
    build = false,
    opts = {},
    config = function()
        require("image").setup({
            backend = "ueberzug",
            processor = "magick_cli",
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = true,
                    download_remote_images = true,
                    only_render_image_at_cursor = true,
                    -- if true, images will be rendered in floating markdown windows
                    floating_windows = true,
                    -- markdown extensions (ie. quarto) can go here
                    filetypes = { "markdown", "vimwiki" },
                },
            },
        })
    end,
}
