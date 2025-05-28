return {
    -- QML
    {
        "peterhoeg/vim-qml",
        ft = { "qml" },
    },
    -- Qmake
    {
        "artoj/qmake-syntax-vim",
        ft = { "qmake" },
        config = function()
            vim.filetype.add({
                extension = {
                    qrc = "xml",
                    ts = "xml",
                },
            })
        end
    }
}
