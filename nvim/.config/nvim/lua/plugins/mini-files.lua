return {
    {
        "echasnovski/mini.nvim",
        version = "*",
        config = function()
            require('mini.files').setup()
            require("which-key").add({
                mode = { "n" },
                { "<leader>ee", "<cmd>lua MiniFiles.open()<cr>", desc = "mini-files" },
            })
        end
    },
}
