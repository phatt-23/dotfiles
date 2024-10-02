return {
    { "tpope/vim-fugitive" },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",     -- optional
            "echasnovski/mini.pick", -- optional
        },
        config = function ()
            require("neogit").setup({})
        end,
    },
}
