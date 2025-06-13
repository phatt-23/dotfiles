return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
        "saghen/blink.cmp"
    },
    config = function()
        require("markview").setup({
            typst = {
                enable = false,
            }
        })
    end
};
