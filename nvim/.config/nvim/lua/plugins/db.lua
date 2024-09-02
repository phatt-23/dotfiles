return {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    "kristijanhusak/vim-dadbod-ui",
    {
        "kndndrj/nvim-dbee",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        build = function()
            -- Install tries to automatically detect the install method.
            -- if it fails, try calling it with one of these parameters:
            --    "curl", "wget", "bitsadmin", "go"
            require("dbee").install()
        end,
        config = function()
            require("dbee").setup( --[[optional config]])
        end,
    },
    config = function()
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
