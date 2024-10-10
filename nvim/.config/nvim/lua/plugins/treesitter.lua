-- lua/plugins/treesitter.lua
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "windwp/nvim-ts-autotag"
    },
}
