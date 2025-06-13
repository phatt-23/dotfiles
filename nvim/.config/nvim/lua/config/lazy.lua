local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- download lazy
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local output = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { output, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})

        vim.fn.getchar()

        os.exit(1)
    end
end


vim.opt.rtp:prepend(lazypath)

-- leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","


local lazy_opts = {
    checker = {
        enabled = true,
        notify = false,
        frequency = 24 * 60 * 60,  -- one day freq
    },
    change_detection = {
        notify = false,
    }
}


-- Auto update on update changes (https://github.com/folke/lazy.nvim/issues/702)
local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end


vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup("autoupdate"),
    callback = function()
        if require("lazy.status").has_updates then
            require("lazy").update({ show = false, })
        end
    end,
})


require("lazy").setup("plugins", lazy_opts)



