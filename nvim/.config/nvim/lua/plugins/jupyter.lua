return {
    {
        "kiyoon/jupynium.nvim",
        build = "pip3 install --user .",
        -- build = "conda run --no-capture-output -n jupynium pip install .",
        -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
        config = function()
            require("jupynium").setup({
                default_notebook_URL = "localhost:8888/notebooks"
            })
        end,
    },
}


