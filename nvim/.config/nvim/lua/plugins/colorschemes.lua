return {
	{
		"blazkowolf/gruber-darker.nvim",
		priority = 1000,
		dependencies = {
			"sho-87/kanagawa-paper.nvim",
			"ellisonleao/gruvbox.nvim",
			"catppuccin/nvim",
			"cocopon/iceberg.vim",
			"zenbones-theme/zenbones.nvim",
			"rktjmp/lush.nvim",
			"slugbyte/lackluster.nvim",
			"cranberry-clockworks/coal.nvim",
			"chriskempson/base16-vim",
			"ryanpcmcquen/true-monochrome_vim",
			"danishprakash/vim-yami",
			"cideM/yui",
		},
		lazy = false,
		opts = {},
		config = function()
			-- vim.cmd([[ 
   --              set termguicolors 
   --              set background=light " or dark
   --              colorscheme zenbones
			-- ]])

			-- require("vesper").setup({
			-- 	transparent = true, -- Boolean: Sets the background to transparent
			-- 	italics = {
			-- 		comments = true, -- Boolean: Italicizes comments
			-- 		keywords = true, -- Boolean: Italicizes keywords
			-- 		functions = true, -- Boolean: Italicizes functions
			-- 		strings = true, -- Boolean: Italicizes strings
			-- 		variables = true, -- Boolean: Italicizes variables
			-- 	},
			-- 	overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
			-- 	palette_overrides = {},
			-- })
			-- vim.cmd.colorscheme("vesper")

			-- vim.cmd.colorscheme("lackluster-mint")
			-- vim.cmd.colorscheme("lackluster-night")
			vim.cmd.colorscheme("lackluster-hack")
			-- vim.cmd.colorscheme("lackluster-dark")
            -- vim.cmd.colorscheme("zenbones")
			-- vim.cmd.colorscheme("base16-black-metal-burzum")
			-- vim.cmd.colorscheme("base16-black-metal-nile")
			-- vim.cmd.colorscheme("base16-grayscale-dark")
			-- vim.cmd.colorscheme("coal")
			-- vim.cmd.colorscheme("true-monochrome")
			-- vim.cmd.colorscheme("yami") -- dark
			-- vim.cmd.colorscheme("yui") -- paper light theme
			-- vim.cmd.colorscheme("yui_dark") -- shit
		end,
	},
}
