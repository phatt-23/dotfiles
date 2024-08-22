return {
	"ggandor/leap.nvim",
	dependencies = {
		"tpope/vim-repeat",
	},
	config = function()
		vim.keymap.set("n",          "<leader>s", "<Plug>(leap)")
		vim.keymap.set("n",          "<leader>S", "<Plug>(leap-from-window)")
		vim.keymap.set({ "x", "o" }, "<leader>s", "<Plug>(leap-forward)")
		vim.keymap.set({ "x", "o" }, "<leader>S", "<Plug>(leap-backward)")
	end,
}
