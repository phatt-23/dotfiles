return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        "kndndrj/nvim-dbee",
        "MunifTanjim/nui.nvim",
        "kristijanhusak/vim-dadbod-completion",
        "tpope/vim-dadbod",
    },
    build = function()
        require("dbee").install()
    end,
    config = function()
        vim.g.db_ui_use_nerd_fonts = 1
        require("dbee").setup( --[[optional config]])

        -- database connections
        require("lspconfig").sqls.setup({
            on_attach = function(client, bufnr)
                require("sqls").on_attach(client, bufnr) -- require sqls.nvim
            end,
            settings = {
                sqls = {
                    connections = {
                        {
                            driver = "mysql",
                            dataSourceName = "mysql://airbnb-user:1234@localhost/airbnb?sslmode=disable",
                        },
                    },
                },
            },
        })
    end,
}
