return {
    "petertriho/nvim-scrollbar",
    config = function ()
        require("scrollbar").setup()
        require("scrollbar.handlers").register("my_marks", function(_)
            return {
                { line = 0 },
                { line = 1, text = "x", type = "Warn" },
                { line = 2, type = "Error" }
            }
        end)
    end,
}
