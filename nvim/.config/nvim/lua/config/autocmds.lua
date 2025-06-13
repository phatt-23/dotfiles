-- dynamic tab sizes based on file type
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "html",
        "htmldjango",
        "css",
        "javascript", "typescript",
        "typescriptreact",
        "svelte",
        "json",
        "yaml",
    },
    callback = function()
        vim.bo.shiftwidth =  2
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
        vim.bo.expandtab = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "java", "cs", "go" },
    callback = function()
        vim.bo.shiftwidth = 4
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.expandtab = true
    end,
})

-- file extension
vim.cmd([[
    autocmd BufRead,BufNewFile *.i3 set filetype=i3config
    autocmd BufRead,BufNewFile *.rasi set filetype=css
    autocmd BufRead,BufNewFile *.tmTheme set filetype=xml
]])
