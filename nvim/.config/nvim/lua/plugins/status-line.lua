return {
	{
		"famiu/feline.nvim",
		config = function()
			local gruber_emacs = {
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

			local gruber = {
				fg = gruber_emacs.fg1,
				bg = gruber_emacs.bg1,
				black = gruber_emacs.bg1,
				skyblue = gruber_emacs.bg2,
				cyan = gruber_emacs.quartz,
				green = gruber_emacs.green,
				oceanblue = gruber_emacs.bg2,
				magenta = gruber_emacs.wisteria,
				orange = gruber_emacs.orange,
				red = gruber_emacs.red1,
				violet = gruber_emacs.violet,
				white = gruber_emacs.white,
				yellow = gruber_emacs.yellow,
			}

			local vi_mode_colors = {
				NORMAL = "yellow",
				OP = "yellow",
				INSERT = "green",
				VISUAL = "purple",
				LINES = "orange",
				BLOCK = "dark_red",
				REPLACE = "red",
				COMMAND = "aqua",
			}

            require("feline").setup({
				disable_icon = true,
				theme = gruber,
                vi_mode_colors = vi_mode_colors,
			})

			-- local line_ok, feline = pcall(require, "feline")
			-- if not line_ok then
			-- 	return
			-- end
			--
			--
			--
			-- local c = {
			-- 	vim_mode = {
			-- 		provider = {
			-- 			name = "vi_mode",
			-- 			opts = {
			-- 				show_mode_name = true,
			-- 				-- padding = "center", -- Uncomment for extra padding.
			-- 			},
			-- 		},
			-- 		hl = function()
			-- 			return {
			-- 				fg = require("feline.providers.vi_mode").get_mode_color(),
			-- 				bg = "bg",
			-- 				style = "bold",
			-- 				name = "NeovimModeHLColor",
			-- 			}
			-- 		end,
			-- 		left_sep = "left_filled",
			-- 		right_sep = "block",
			-- 	},
			-- 	gitBranch = {
			-- 		provider = "git_branch",
			-- 		hl = {
			-- 			fg = "peanut",
			-- 			bg = "bg",
			-- 			style = "bold",
			-- 		},
			-- 		left_sep = "block",
			-- 		right_sep = "block",
			-- 	},
			-- 	gitDiffAdded = {
			-- 		provider = "git_diff_added",
			-- 		hl = {
			-- 			fg = "green",
			-- 			bg = "bg",
			-- 		},
			-- 		left_sep = "block",
			-- 		right_sep = "block",
			-- 	},
			-- 	gitDiffRemoved = {
			-- 		provider = "git_diff_removed",
			-- 		hl = {
			-- 			fg = "red",
			-- 			bg = "bg",
			-- 		},
			-- 		left_sep = "block",
			-- 		right_sep = "block",
			-- 	},
			-- 	gitDiffChanged = {
			-- 		provider = "git_diff_changed",
			-- 		hl = {
			-- 			fg = "fg",
			-- 			bg = "bg",
			-- 		},
			-- 		left_sep = "block",
			-- 		right_sep = "right_filled",
			-- 	},
			-- 	separator = {
			-- 		provider = "",
			-- 	},
			-- 	fileinfo = {
			-- 		provider = {
			-- 			name = "file_info",
			-- 			opts = {
			-- 				type = "relative-short",
			-- 			},
			-- 		},
			-- 		hl = {
			-- 			style = "bold",
			-- 		},
			-- 		left_sep = " ",
			-- 		right_sep = " ",
			-- 	},
			-- 	diagnostic_errors = {
			-- 		provider = "diagnostic_errors",
			-- 		hl = {
			-- 			fg = "red",
			-- 		},
			-- 	},
			-- 	diagnostic_warnings = {
			-- 		provider = "diagnostic_warnings",
			-- 		hl = {
			-- 			fg = "yellow",
			-- 		},
			-- 	},
			-- 	diagnostic_hints = {
			-- 		provider = "diagnostic_hints",
			-- 		hl = {
			-- 			fg = "aqua",
			-- 		},
			-- 	},
			-- 	diagnostic_info = {
			-- 		provider = "diagnostic_info",
			-- 	},
			-- 	lsp_client_names = {
			-- 		provider = "lsp_client_names",
			-- 		hl = {
			-- 			fg = "purple",
			-- 			bg = "bg",
			-- 			style = "bold",
			-- 		},
			-- 		left_sep = "left_filled",
			-- 		right_sep = "block",
			-- 	},
			-- 	file_type = {
			-- 		provider = {
			-- 			name = "file_type",
			-- 			opts = {
			-- 				filetype_icon = true,
			-- 				case = "titlecase",
			-- 			},
			-- 		},
			-- 		hl = {
			-- 			fg = "red",
			-- 			bg = "bg",
			-- 			style = "bold",
			-- 		},
			-- 		left_sep = "block",
			-- 		right_sep = "block",
			-- 	},
			-- 	file_encoding = {
			-- 		provider = "file_encoding",
			-- 		hl = {
			-- 			fg = "orange",
			-- 			bg = "bg",
			-- 			style = "italic",
			-- 		},
			-- 		left_sep = "block",
			-- 		right_sep = "block",
			-- 	},
			-- 	position = {
			-- 		provider = "position",
			-- 		hl = {
			-- 			fg = "green",
			-- 			bg = "bg",
			-- 			style = "bold",
			-- 		},
			-- 		left_sep = "block",
			-- 		right_sep = "block",
			-- 	},
			-- 	line_percentage = {
			-- 		provider = "line_percentage",
			-- 		hl = {
			-- 			fg = "aqua",
			-- 			bg = "bg",
			-- 			style = "bold",
			-- 		},
			-- 		left_sep = "block",
			-- 		right_sep = "block",
			-- 	},
			-- 	scroll_bar = {
			-- 		provider = "scroll_bar",
			-- 		hl = {
			-- 			fg = "yellow",
			-- 			style = "bold",
			-- 		},
			-- 	},
			-- }
			--
			-- local left = {
			-- 	c.vim_mode,
			-- 	c.gitBranch,
			-- 	c.gitDiffAdded,
			-- 	c.gitDiffRemoved,
			-- 	c.gitDiffChanged,
			-- 	c.separator,
			-- }
			--
			-- local middle = {
			-- 	c.fileinfo,
			-- 	c.diagnostic_errors,
			-- 	c.diagnostic_warnings,
			-- 	c.diagnostic_info,
			-- 	c.diagnostic_hints,
			-- }
			--
			-- local right = {
			-- 	c.lsp_client_names,
			-- 	c.file_type,
			-- 	-- c.file_encoding,
			-- 	c.position,
			-- 	c.line_percentage,
			-- 	-- c.scroll_bar,
			-- }
			--
			-- local components = {
			-- 	active = {
			-- 		left,
			-- 		middle,
			-- 		right,
			-- 	},
			-- 	inactive = {
			-- 		left,
			-- 		middle,
			-- 		right,
			-- 	},
			-- }
			--
			-- feline.setup({
			-- 	components = components,
			-- 	theme = gruber_darker,
			-- 	vi_mode_colors = vi_mode_colors,
			-- }
			vim.o.laststatus = 3
		end,
	},
}
