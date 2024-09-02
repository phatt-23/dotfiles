-- gruber colors
local gruber = {
	fg1 = "#f4f4ff",
	fg2 = "#f5f5f5",
	white = "#ffffff",
	black = "#000000",
	bg_1 = "#101010",
	bg = "#181818",
	bg1 = "#282828",
	bg2 = "#453d41",
	bg3 = "#484848",
	bg4 = "#52494e",
	red_1 = "#c73c3f",
	red = "#f43841",
	red1 = "#ff4f58",
	green = "#73c936",
	yellow = "#ffdd33",
	brown = "#cc8c3c",
	quartz = "#95a99f",
	niagara1 = "#5f627f",
	niagara = "#96a6c8",
	wisteria = "#9e95c7",
	orange = "#ff9933",
	violet = "#8e6fcc",
}

-- for lualine
local color_scheme = {
	normal = {
		a = { bg = gruber.yellow, fg = gruber.black, gui = "bold" },
		b = { bg = gruber.bg2, fg = gruber.white },
		c = { bg = gruber.bg1, fg = gruber.white },
	},
	insert = {
		a = { bg = gruber.niagara, fg = gruber.black, gui = "bold" },
		b = { bg = gruber.bg2, fg = gruber.white },
		c = { bg = gruber.bg1, fg = gruber.white },
	},
	visual = {
		a = { bg = gruber.green, fg = gruber.black, gui = "bold" },
		b = { bg = gruber.bg2, fg = gruber.white },
		c = { bg = gruber.bg1, fg = gruber.white },
	},
	replace = {
		a = { bg = gruber.wisteria, fg = gruber.black, gui = "bold" },
		b = { bg = gruber.bg2, fg = gruber.white },
		c = { bg = gruber.bg1, fg = gruber.white },
	},
	command = {
		a = { bg = gruber.orange, fg = gruber.black, gui = "bold" },
		b = { bg = gruber.bg2, fg = gruber.white },
		c = { bg = gruber.bg1, fg = gruber.white },
	},
	inactive = {
		a = { bg = gruber.yellow, fg = gruber.black, gui = "bold" },
		b = { bg = gruber.bg2, fg = gruber.white },
		c = { bg = gruber.bg1, fg = gruber.white },
	},
}

local mode_map = {
	["NORMAL"] = "N",
	["O-PENDING"] = "N?",
	["INSERT"] = "I",
	["VISUAL"] = "V",
	["V-BLOCK"] = "VB",
	["V-LINE"] = "VL",
	["V-REPLACE"] = "VR",
	["REPLACE"] = "R",
	["COMMAND"] = "!",
	["SHELL"] = "SH",
	["TERMINAL"] = "T",
	["EX"] = "X",
	["S-BLOCK"] = "SB",
	["S-LINE"] = "SL",
	["SELECT"] = "S",
	["CONFIRM"] = "Y?",
	["MORE"] = "M",
}

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = color_scheme,
					globalstatus = true,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { {
						"mode",
						fmt = function(s)
							return mode_map[s] or s
						end,
					} },
				},
			})
		end,
	},
	-- {
	-- 	"famiu/feline.nvim",
	-- 	config = function()
	-- 		local gruber_emacs = {
	-- 			fg1 = "#f4f4ff",
	-- 			fg2 = "#f5f5f5",
	-- 			white = "#ffffff",
	-- 			black = "#000000",
	-- 			bg_1 = "#101010",
	-- 			bg = "#181818",
	-- 			bg1 = "#282828",
	-- 			bg2 = "#453d41",
	-- 			bg3 = "#484848",
	-- 			bg4 = "#52494e",
	-- 			red_1 = "#c73c3f",
	-- 			red = "#f43841",
	-- 			red1 = "#ff4f58",
	-- 			green = "#73c936",
	-- 			yellow = "#ffdd33",
	-- 			brown = "#cc8c3c",
	-- 			quartz = "#95a99f",
	-- 			niagara1 = "#5f627f",
	-- 			niagara = "#96a6c8",
	-- 			wisteria = "#9e95c7",
	-- 			orange = "#ff9933",
	-- 			violet = "#8e6fcc",
	-- 		}
	--
	-- 		local gruber = {
	-- 			fg = gruber_emacs.fg1,
	-- 			bg = gruber_emacs.bg1,
	-- 			black = gruber_emacs.bg1,
	-- 			skyblue = gruber_emacs.bg2,
	-- 			cyan = gruber_emacs.quartz,
	-- 			green = gruber_emacs.green,
	-- 			oceanblue = gruber_emacs.bg2,
	-- 			magenta = gruber_emacs.wisteria,
	-- 			orange = gruber_emacs.orange,
	-- 			red = gruber_emacs.red1,
	-- 			violet = gruber_emacs.violet,
	-- 			white = gruber_emacs.white,
	-- 			yellow = gruber_emacs.yellow,
	-- 		}
	--
	-- 		local vi_mode_colors = {
	-- 			NORMAL = "yellow",
	-- 			OP = "yellow",
	-- 			INSERT = "green",
	-- 			VISUAL = "purple",
	-- 			LINES = "orange",
	-- 			BLOCK = "dark_red",
	-- 			REPLACE = "red",
	-- 			COMMAND = "aqua",
	-- 		}
	--
	--            require("feline").setup({
	-- 			theme = gruber,
	--                vi_mode_colors = vi_mode_colors,
	-- 		})
	--
	-- 		vim.o.laststatus = 3
	-- 	end,
	-- },
}
