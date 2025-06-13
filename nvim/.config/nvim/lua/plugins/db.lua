return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        {
            'tpope/vim-dadbod',
            lazy = true
        },
        {
            'kristijanhusak/vim-dadbod-completion',
            ft = { 'sql', 'mysql', 'plsql', 'psql' },
            lazy = true
        }, -- Optional
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1

        -- autocmd FileType sql,mysql,plsql
        -- lua require('cmp').setup.buffer({
        -- sources = {{ name = 'vim-dadbod-completion' }} })

        local cmp = require("cmp")

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "sql", "mysql", "plsql" },
            callback = function()
                cmp.setup.buffer {
                    sources = {
                        { name = 'vim-dadbod-completion' }
                    }
                }
            end,
        })
    end,
}
